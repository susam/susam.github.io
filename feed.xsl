<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom"
                exclude-result-prefixes="atom">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/atom:feed">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>
          <xsl:value-of select="atom:subtitle"/>
        </title>
        <style>
          body {
            font-family: georgia, serif;
            font-size: large;
            line-height: 1.5;
            margin: 0 auto;
            max-width: 40em;
            overflow-wrap: break-word;
            padding: 0 1em;
          }
          h1, h2, h3, h4, h5, h6 {
            margin: 1.25em 0 0.25em 0;
            line-height: 1.2;
          }
          main h1 + div {
            margin: 0.5em 0;
          }
          a:empty:before {
            content: "#";
          }
          a:empty {
            visibility: hidden;
            padding-left: 0.25em;
          }
          :hover > a:empty {
            visibility: visible;
          }
          blockquote, pre, kbd, .highlight {
            background: #eee;
          }
          blockquote {
            border-left: thick solid #ccc;
          }
          pre {
            overflow: auto;
          }
          blockquote, pre, .highlight {
            margin: 1em 0;
            padding: 0.5em;
          }
          blockquote > *:first-child, .highlight > *:first-child {
            margin-top: 0;
          }
          blockquote > *:last-child, .highlight > *:last-child {
            margin-bottom: 0;
          }
          pre, code, samp, kbd, .mono {
            font-family: monospace,monospace;
            font-size: 0.9em;
          }
          pre code, pre samp, pre kbd, .mono kbd {
            font-size: 1.0em;
          }
          code, samp kbd {
            color: #050;
          }
          samp {
            color: #730;
          }
          pre .cursor {
            background: #730;
            color: #eee;
          }
          kbd {
            border: thin solid #ccc;
            box-shadow: 0 0.15em 0.15em #ccc;
            border-radius: 0.2em;
            padding: 0.1em 0.2em;
          }
          samp kbd {
            border: none;
            box-shadow: none;
            padding: 0;
          }
          ul.blog {
            margin-top: 1.5em;
            list-style-type: none;
            padding: 0;
          }
          ul.blog li {
            margin: 1em 0;
          }
          hr {
            margin: 1.5em auto;
            border: 0;
            border-bottom: 0.15em dotted #999;
          }
          footer {
            text-align: center;
          }
          footer nav a {
            margin-right: 1.5em;
            line-height: 2.5;
          }
          footer nav a:last-child  {
            margin-right: 0;
          }
          @media (prefers-color-scheme: dark) {
            body {
              background: #111;
              color: #bbb;
            }
            a:link {
              color: #9bf;
            }
            a:visited {
              color: #a9f;
            }
            a:focus, a:hover {
              color: #9cf;
            }
            a:active {
              color: #f99;
            }
            blockquote, pre, kbd, .highlight {
              background: #000;
              box-shadow: 0 0 0.5em #333;
            }
            blockquote {
              border-left-color: #333;
            }
            code, pre kbd {
              color: #9c6;
            }
            samp {
              color: #db0;
            }
            pre .cursor {
              background: #db0;
              color: #000;
            }
            kbd {
              border-color: #333;
              box-shadow: 0 0.15em 0.15em #333;
            }
            hr {
              border-bottom-color: #666;
            }
          }
          audio {
            min-width: 75%;
            max-width: 100%;
          }
          figure {
            text-align: center;
            margin: 1em 0;
          }
          figure img, figure video {
            max-width: 100%;
          }
          .stretch img {
            width: 100%;
          }
          .lightshadow img {
            box-shadow: 0em 0em 0.5em #999;
          }
          figcaption {
            font-size: medium;
          }
          table {
            margin-top: 1em;
            margin-bottom: 1em;
          }
          th {
            text-align: left;
          }
          th, td {
            padding-right: 1em;
          }
          td *:first-child {
            margin-top: 0;
          }
          td *:last-child {
            margin-bottom: 0;
          }
          table.grid {
            border-collapse: collapse;
          }
          table.grid th, table.grid td {
            border-width: thin;
            border-style: solid;
          }
          table.grid th, table.grid td {
            padding: 0.3em 0.4em;
          }
          table.ruled {
            border-collapse: collapse;
            border-top-width: medium;
            border-top-style: double;
            border-bottom-width: medium;
            border-bottom-style: double;
          }
          table.ruled thead {
            border-bottom-width: medium;
            border-bottom-style: double;
          }
          table.ruled tr {
            border-bottom-width: thin;
            border-bottom-style: solid;
          }
          table.ruled th, table.ruled td {
            padding: 0.3em 0.4em;
          }
          table.top td {
            vertical-align: top;
          }
          table, thead, tr, th, td {
            border-color: #999;
          }
          noscript div {
            border: medium double #900;
            color: #900;
            padding: 0 1em;
          }
          .box {
            border: thin solid #999;
            margin: 1em 0;
            padding: 1em;
          }
          .box *:first-child {
            margin-top: 0;
          }
          .box *:last-child {
            margin-bottom: 0;
          }
          .textcenter {
            text-align: center;
          }
          .center {
            margin-left: auto;
            margin-right: auto;
          }
          .light {
            display: block;
          }
          .dark {
            display: none;
          }
          .ctrl-l:before {
            content: "^L";
          }
          .hl {
            color: #808;
          }
          .pre {
            white-space: pre;
          }
          .wrap {
            word-break: break-all;
            white-space: pre-wrap;
          }
          .question {
            margin-top: 1.5em;
            font-weight: bold;
          }
          .c0 {color: #000} /* contrast: 18.1 */
          .c1 {color: #00c} /* contrast:  9.7 */
          .c2 {color: #050} /* constrast: 7.9 */
          .c3 {color: #055} /* contrast:  7.4 */
          .c4 {color: #900} /* contrast:  7.7 */
          .c5 {color: #808} /* contrast:  7.5 */
          .c6 {color: #440} /* contrast:  8.7 */
          .c7 {color: #444} /* contrast:  8.4 */
          @media (prefers-color-scheme: dark) {
            .soft img {
              opacity: 0.7; /* (0xbb - 0x11) / (0xff - 0x11) */
            }
            .lightshadow img {
              box-shadow: none;
            }
            table, thead, tr, th, td, .email {
              border-color: #666;
            }
            .light {
              display: none;
            }
            .dark {
              display: block;
            }
            .hl {
              color: #f9c;
            }
            .c0 {color: #aaa} /* contrast:  9.0 */
            .c1 {color: #6bf} /* contrast: 10.1 */
            .c2 {color: #0c0} /* contrast:  9.6 */
            .c3 {color: #0cc} /* contrast: 10.5 */
            .c4 {color: #f88} /* contrast:  9.1 */
            .c5 {color: #f9f} /* contrast: 11.3 */
            .c6 {color: #dd0} /* contrast: 14.4 */
            .c7 {color: #ddd} /* contrast: 15.5 */
          }
        </style>
        <style>details { margin: 1em 0 }</style>
      </head>
      <body>
        <h1><xsl:value-of select="atom:subtitle"/></h1>
        <div>(<xsl:value-of select="count(atom:entry)"/> items)</div>
        <p>
          This is an Atom news feed.  It is meant to be read using a
          feed reader application rather than viewed directly in a web
          browser.  To use it, copy this document's URL from your
          browser's address bar and add it to your feed reader.
        </p>
        <xsl:for-each select="atom:entry">
          <details>
            <summary>
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="atom:link/@href"/>
                </xsl:attribute>
                <xsl:value-of select="atom:title"/>
              </a>
              (<xsl:value-of select="substring(atom:updated, 1, 10)"/>)
            </summary>
            <xsl:value-of select="atom:content" disable-output-escaping="yes"/>
          </details>
        </xsl:for-each>
        <footer>
          <hr/>
          <nav>
            <a href="./">Home</a>
            <a href="./links.html">Links</a>
            <a href="./about.html">About</a>
            <a href="https://codeberg.org/susam">Codeberg</a>
            <a href="https://mastodon.social/@susam">Mastodon</a>
          </nav>
          <p>
            &#xa9; 2001&#x2013;2026 Susam Pal
          </p>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
