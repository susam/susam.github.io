<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/rss/channel">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>
          <xsl:value-of select="description"/>
        </title>
        <style>
          body {
            color: #333;
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
          a:link {
            color: #00e;
          }
          a:visited {
            color: #518;
          }
          a:focus, a:hover {
            color: #03f;
          }
          a:active {
            color: #a00;
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
            margin: 1em 0;
          }
          pre {
            overflow: auto;
          }
          blockquote, pre, .highlight {
            padding: 0.5em;
          }
          blockquote *:first-child, .highlight *:first-child {
            margin-top: 0;
          }
          blockquote *:last-child, .highlight *:last-child {
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
          .soft img {
            opacity: 0.8; /* (0xff - 0x33) / 0xff */
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
          .wrap {
            word-break: break-all;
            white-space: pre-wrap;
          }
          .question {
            margin-top: 1.5em;
            font-weight: bold;
          }
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
          }
        </style>
      </head>
      <body>
        <h1>
          <xsl:value-of select="description"/>
        </h1>
        <xsl:for-each select="item">
          <!-- <h2 id="[guid]">title<a href="#[guid]"></a><a href="#[guid]"></a></h2> -->
          <h2>
            <xsl:attribute name="id">
              <xsl:value-of select="translate(guid, ':/.?', '---')"/>
            </xsl:attribute>
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="link"/>
              </xsl:attribute>
              <xsl:value-of select="title"/>
            </a>
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="concat('#', translate(guid, ':/.?', '---'))"/>
              </xsl:attribute>
            </a>
          </h2>
          <!-- <div>Published on [date]</div> -->
          <div>
            <xsl:text>Published on </xsl:text>
            <xsl:value-of select="substring(pubDate, 6, 11)"/>
          </div>
          <!-- <p>[first paragraph]</p> -->
          <p>
            <xsl:value-of
                select="substring-after(substring-before(description, '&lt;/p&gt;'), '&lt;p&gt;')"
                disable-output-escaping="yes"/> ...
          </p>
          <!-- <p><a href="[link]">Read on website</a> | <a href="[first-tag]">#[first-tag]</a></p>-->
          <p>
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="link"/>
              </xsl:attribute>
              <xsl:text>Read on website</xsl:text>
            </a>
            <xsl:text> | </xsl:text>
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="substring-before(substring-after(substring-after(substring-after(description, '&lt;!-- ### --&gt;'), '|'), '&lt;a href=&quot;'), '&quot;')"/>
              </xsl:attribute>
              <xsl:value-of select="substring-before(substring-after(substring-after(substring-after(description, '&lt;!-- ### --&gt;'), '|'), '&gt;'), '&lt;')"/>
            </a>
          </p>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
