<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: eshell-autojump.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=eshell-autojump.el" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: eshell-autojump.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=eshell-autojump.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for eshell-autojump.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=eshell-autojump.el" /><meta content="width=device-width" name="viewport" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  // https://stackoverflow.com/questions/280634/endswith-in-javascript
  if (typeof String.prototype.endsWith !== 'function') {
    String.prototype.endsWith = function(suffix) {
      return this.indexOf(suffix, this.length - suffix.length) !== -1;
    };
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;

	items = toc.getElementsByTagName('a');
	for (var i = 0; i < items.length; i++) {
	  while (items[i].textContent.endsWith('â')) {
            var text = items[i].childNodes[0].nodeValue;
	    items[i].childNodes[0].nodeValue = text.substring(0, text.length - 1);
	  }
	}
      }
    }
  }

  addOnloadEvent(initToc);
  </script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://emacswiki.org/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><div class="menu"><span class="gotobar bar"><a href="http://www.emacswiki.org/emacs/SiteMap" class="local">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a href="http://www.emacswiki.org/emacs/ElispArea" class="local">ElispArea</a> <a href="http://www.emacswiki.org/emacs/HowTo" class="local">HowTo</a> <a href="http://www.emacswiki.org/emacs/Glossary" class="local">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><form method="get" action="http://www.emacswiki.org/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search"><p><label for="search">Search:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p></form></div><h1><a href="http://www.emacswiki.org/emacs?search=%22eshell-autojump%5c.el%22" rel="nofollow" title="Click to search for references to this page">eshell-autojump.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/eshell-autojump.el">Download</a></p><pre><span class="comment">;;; eshell-autojump.el -- autojump command for Eshell</span>
<span class="comment">;; Copyright 2013-2014  Alex Schroeder</span>

<span class="comment">;; This program is free software: you can redistribute it and/or modify it</span>
<span class="comment">;; under the terms of the GNU General Public License as published by the Free</span>
<span class="comment">;; Software Foundation, either version 3 of the License, or (at your option)</span>
<span class="comment">;; any later version.</span>
<span class="comment">;;</span>
<span class="comment">;; This program is distributed in the hope that it will be useful, but WITHOUT</span>
<span class="comment">;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or</span>
<span class="comment">;; FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for</span>
<span class="comment">;; more details.</span>
<span class="comment">;;</span>
<span class="comment">;; You should have received a copy of the GNU General Public License along</span>
<span class="comment">;; with this program. If not, see &lt;http://www.gnu.org/licenses/&gt;.</span>

<span class="comment">;;; Commentary:</span>

<span class="comment">;; Use the command j to list common directories and to jump to them.</span>

<span class="comment">;;; Code:</span>

(<span class="keyword">require</span> '<span class="constant">eshell</span>)

(<span class="keyword">defun</span> <span class="function">eshell/j</span> (<span class="type">&amp;rest</span> args)
  <span class="string">"Jump to a directory you often cd to.
This compares the argument with the list of directories you usually jump to.
Without an argument, list the ten most common directories.
With a positive integer argument, list the n most common directories.
Otherwise, call `<span class="constant important">eshell/cd</span>' with the result."</span>
  (setq args (eshell-flatten-list args))
  (<span class="keyword elisp">let</span> ((arg (or (car args) 10))
	(map (make-hash-table <span class="builtin">:test</span> 'equal))
	(<span class="keyword cl">case</span>-fold-search (eshell-under-windows-p))
	candidates
	result)
    <span class="comment">;; count paths in the ring and produce a map</span>
    (<span class="keyword cl">dolist</span> (dir (ring-elements eshell-last-dir-ring))
      (<span class="keyword elisp">if</span> (gethash dir map)
	  (puthash dir (1+ (gethash dir map)) map)
	(puthash dir 1 map)))
    <span class="comment">;; use the map to build a sorted list of candidates</span>
    (maphash (<span class="keyword elisp">lambda</span> (key value)
	       (setq candidates (cons key candidates)))
	     map)
    (setq candidates (sort candidates
			   (<span class="keyword elisp">lambda</span> (a b)
			     (&gt; (gethash a map)
				(gethash b map)))))
    <span class="comment">;; list n candidates or jump to most popular candidate</span>
    (<span class="keyword elisp">if</span> (and (integerp arg) (&gt; arg 0))
	(<span class="keyword elisp">progn</span>
	  (<span class="keyword elisp">let</span> ((n (nthcdr (1- arg) candidates)))
	    (<span class="keyword cl">when</span> n
	      (setcdr n nil)))
	  (eshell-lisp-command
	   (mapconcat (<span class="keyword elisp">lambda</span> (s)
			(format <span class="string">"%4d %s"</span> (gethash s map) s))
		      candidates <span class="string">"\n"</span>)))
      (<span class="keyword elisp">while</span> (and candidates (not result))
	(<span class="keyword elisp">if</span> (string-match arg (car candidates))
	    (setq result (car candidates))
	  (setq candidates (cdr candidates))))
      (eshell/cd result))))

(<span class="keyword">provide</span> '<span class="constant">eshell-autojump</span>)
    
<span class="comment">;;; eshell-autojump.el ends here</span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="translation bar"><br />  <a href="http://www.emacswiki.org/emacs?action=translate;id=eshell-autojump.el;missing=de_es_fr_it_ja_ko_pt_ru_se_uk_zh" class="translation new" rel="nofollow">Add Translation</a></span><div class="edit bar"><a accesskey="c" href="http://www.emacswiki.org/emacs/Comments_on_eshell-autojump.el" class="comment local edit">Talk</a> <a class="edit" href="http://www.emacswiki.org/emacs?action=edit;id=eshell-autojump.el" accesskey="e" title="Click to edit this page" rel="nofollow">Edit this page</a> <a href="http://www.emacswiki.org/emacs?action=history;id=eshell-autojump.el" class="history" rel="nofollow">View other revisions</a> <a rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=eshell-autojump.el" class="admin">Administration</a></div><div class="time">Last edited 2014-10-24 14:27 UTC by <a class="author" href="http://www.emacswiki.org/emacs/AlexSchroeder" title="77.57.43.153">AlexSchroeder</a> <a rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=eshell-autojump.el" class="diff">(diff)</a></div><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
