# Wabbit Inc

Wabbitinc as an eleventy site. Shamelessly stolen from https://github.com/11ty/eleventy-base-blog.git 

The css was stolen from https://simplecss.org and then heavily modified

## To test locally

```
npx @11ty/eleventy --serve
```
use npm for package updates, and nvm for node/npm updates


## Photos and Scans

Photos are all at smugmug. See [smug-cli](https://github.com/mblevins/smug-cli) for some tools using smugmug galleries and posts

Scans are pushed to a cloudflare bucket. To process a set of scans:

- Scan the pictures with a camera
- Export the pictures to a scan directory /scans/scan{date}{seq-num}
- Create a post in the /content/scans directory
- Run process_scan.sh scan{date}{seq-num} (use -t if it should be transcribed)

## Production

This is hosted at cloudflare using pages.

## Some handy links

- [A tutorial](https://www.netlify.com/blog/2020/04/09/lets-learn-eleventy-boost-your-jamstack-skills-with-11ty/)
- [Simple CSS](https://github.com/kevquirk/simple.css/wiki/Getting-Started-With-Simple.css)
- [Eleventy template language](https://www.11ty.dev/docs/languages/nunjucks/)
- [Data Cascade](https://benmyers.dev/blog/eleventy-data-cascade/)ic
- [Great discussion on figure flow](https://jeffbridgforth.com/having-figure-match-width-of-contained-image/)

