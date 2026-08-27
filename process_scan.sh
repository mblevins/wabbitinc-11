#! /bin/bash
# process a scan directory

# some of this don't have flags, set flags for script development
DO_RCLONE=1
DO_SIP=1
DO_GALLERY=1
DO_TRANSCRIBE=0

while getopts ":t" opt; do
  case ${opt} in
    t ) # process option t
      DO_TRANSCRIBE=1
      ;;
    \? ) 
      echo "Usage: $0 [-t]"
      ;;
  esac
done
shift $((OPTIND -1))

scan_dir=$1
base_source_dir=scans
base_content_dir=content/scans
orig_dir=$PWD

if [ -z "$scan_dir" ]; then
  echo "Usage: $0 <scan_directory>"
  exit 1
fi

if [ ! -d "$base_source_dir/$scan_dir" ]; then
  echo "$base_source_dir/$scan_dir is not a valid directory."
  exit 1
fi

if [ ! -d "$base_source_dir/$scan_dir" ]; then
  echo "$base_source_dir/$scan_dir doesn't exist."
  exit 1
fi

pushd "$base_source_dir/$scan_dir" || exit 1
base_content_dir=$orig_dir/$base_content_dir

mkdir -p "$base_content_dir/$scan_dir" || exit 1

files=$(find -E . -type f -regex '\./[A-Z0-9_]+\.jpeg'  | sort)

if [ -z "$files" ]; then
  echo "No JPEG files found in $base_source_dir/$scan_dir."
  exit 1
fi

if [ $DO_SIP -eq 1 ]; then
  rm -f *-thumb.jpeg
  for file in $files; do sips -Z 200 "$file" --out "${file%.jpeg}-thumb.jpeg"; done
fi

if [ $DO_RCLONE -eq 1 ]; then
  rclone sync -v --fast-list . cloudflare:/scans/$scan_dir
fi

if [ $DO_TRANSCRIBE -eq 1 ]; then
    uv --project ~/repos/handwritingocr-cli run ~/repos/handwritingocr-cli/transcribe.py --output $base_content_dir/$scan_dir/transcription.md $files
    if [ $? -ne 0 ]; then
        echo "Transcription failed."
        exit 1
    fi
fi

if [ $DO_GALLERY -eq 1 ]; then
  rm -f $base_content_dir/$scan_dir/images.html
  for file in $files; do
    echo $file
    file=$(basename $file .jpeg)
    echo "<a href=\"https://scans.wabbitinc.com/$scan_dir/${file}.jpeg\" target=\"_blank\"><img src=\"https://scans.wabbitinc.com/$scan_dir/${file}-thumb.jpeg\" alt=\"${file}\" loading=\"lazy\"></a>" >> $base_content_dir/$scan_dir/images.html
  done
fi

echo "Completed!"





