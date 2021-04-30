# global_snack_bar

Provides a class for a global snack bar. This makes it convenient to summon a `SnackBar` with simple code, regardless of the `Scaffold` that is currently visible.  

This is useful for cases such as intermittently checking the network connection — cases where you don't know what `Scaffold` will be visible before needing to show a `SnackBar`.  

Just wrap your content in `GlobalMsgWrapper`.  

Make sure that your content is a child of a `Scaffold`.  

Then, from anywhere, use the following to show a `SnackBar`: 
<pre class="hljs" style="color: rgb(169, 183, 198); background: rgb(40, 43, 46); display: block; overflow-x: auto; padding: 0.5em;"><span class="hljs-type" style="color: rgb(255, 198, 109);">GlobalSnackBarBloc</span>.showMessage(
  <span class="hljs-type" style="color: rgb(255, 198, 109);">GlobalMsg</span>(<span class="hljs-string" style="color: rgb(106, 135, 89);">"hello"</span>, bgColor: <span class="hljs-type" style="color: rgb(255, 198, 109);">Colors</span>.cyanAccent),
); </pre>

## How to use

<pre class="hljs" style="color: rgb(169, 183, 198); background: rgb(40, 43, 46); display: block; overflow-x: auto; padding: 0.5em;"><span class="hljs-keyword" style="color: rgb(204, 120, 50);">import</span> <span class="hljs-symbol" style="color: rgb(104, 151, 187);">'package</span>:flutter/material.dart';
<span class="hljs-keyword" style="color: rgb(204, 120, 50);">import</span> <span class="hljs-symbol" style="color: rgb(104, 151, 187);">'package</span>:global_snack_bar/global_snack_bar.dart';


void main() {
  runApp(<span class="hljs-type" style="color: rgb(255, 198, 109);">MyApp</span>());
}

<span class="hljs-class"><span class="hljs-keyword" style="color: rgb(204, 120, 50);">class</span> <span class="hljs-title" style="color: rgb(255, 198, 109);">MyApp</span> <span class="hljs-keyword" style="color: rgb(204, 120, 50);">extends</span> <span class="hljs-title" style="color: rgb(255, 198, 109);">StatelessWidget</span> </span>{
  <span class="hljs-meta" style="color: rgb(187, 181, 41);">@override</span>
  <span class="hljs-type" style="color: rgb(255, 198, 109);">Widget</span> build(<span class="hljs-type" style="color: rgb(255, 198, 109);">BuildContext</span> context) {
    <span class="hljs-keyword" style="color: rgb(204, 120, 50);">return</span> <span class="hljs-type" style="color: rgb(255, 198, 109);">MaterialApp</span>(
      title: <span class="hljs-symbol" style="color: rgb(104, 151, 187);">'Global</span> <span class="hljs-type" style="color: rgb(255, 198, 109);">Snack</span> <span class="hljs-type" style="color: rgb(255, 198, 109);">Bar</span> <span class="hljs-type" style="color: rgb(255, 198, 109);">Example</span>',
      theme: <span class="hljs-type" style="color: rgb(255, 198, 109);">ThemeData</span>(
        primarySwatch: <span class="hljs-type" style="color: rgb(255, 198, 109);">Colors</span>.blue,
      ),
      home: <span class="hljs-type" style="color: rgb(255, 198, 109);">HomePage</span>(title: <span class="hljs-symbol" style="color: rgb(104, 151, 187);">'Global</span> <span class="hljs-type" style="color: rgb(255, 198, 109);">Snack</span> <span class="hljs-type" style="color: rgb(255, 198, 109);">Bar</span> <span class="hljs-type" style="color: rgb(255, 198, 109);">Example</span>'),
    );
  }
}

<span class="hljs-class"><span class="hljs-keyword" style="color: rgb(204, 120, 50);">class</span> <span class="hljs-title" style="color: rgb(255, 198, 109);">HomePage</span> <span class="hljs-keyword" style="color: rgb(204, 120, 50);">extends</span> <span class="hljs-title" style="color: rgb(255, 198, 109);">StatefulWidget</span> </span>{
  <span class="hljs-type" style="color: rgb(255, 198, 109);">HomePage</span>({<span class="hljs-type" style="color: rgb(255, 198, 109);">Key</span> key, <span class="hljs-keyword" style="color: rgb(204, 120, 50);">this</span>.title}) : <span class="hljs-keyword" style="color: rgb(204, 120, 50);">super</span>(key: key);

  <span class="hljs-keyword" style="color: rgb(204, 120, 50);">final</span> <span class="hljs-type" style="color: rgb(255, 198, 109);">String</span> title;

  <span class="hljs-meta" style="color: rgb(187, 181, 41);">@override</span>
  _HomePageState createState() =&gt; _HomePageState();
}

<span class="hljs-class"><span class="hljs-keyword" style="color: rgb(204, 120, 50);">class</span> <span class="hljs-title" style="color: rgb(255, 198, 109);">_HomePageState</span> <span class="hljs-keyword" style="color: rgb(204, 120, 50);">extends</span> <span class="hljs-title" style="color: rgb(255, 198, 109);">State&lt;HomePage&gt;</span> </span>{
  <span class="hljs-meta" style="color: rgb(187, 181, 41);">@override</span>
  <span class="hljs-type" style="color: rgb(255, 198, 109);">Widget</span> build(<span class="hljs-type" style="color: rgb(255, 198, 109);">BuildContext</span> context) {
    <span class="hljs-keyword" style="color: rgb(204, 120, 50);">return</span> <span class="hljs-type" style="color: rgb(255, 198, 109);">Scaffold</span>(
      appBar: <span class="hljs-type" style="color: rgb(255, 198, 109);">AppBar</span>(
        title: <span class="hljs-type" style="color: rgb(255, 198, 109);">Text</span>(widget.title),
      ),
      body: <span class="hljs-type" style="color: rgb(255, 198, 109);">GlobalMsgWrapper</span>(
        <span class="hljs-type" style="color: rgb(255, 198, 109);">Center</span>(
          child: <span class="hljs-type" style="color: rgb(255, 198, 109);">Text</span>(<span class="hljs-string" style="color: rgb(106, 135, 89);">"Hello, World"</span>),
        ),
      ),
      floatingActionButton: <span class="hljs-type" style="color: rgb(255, 198, 109);">FloatingActionButton</span>(
        onPressed: () {
          <span class="hljs-type" style="color: rgb(255, 198, 109);">GlobalSnackBarBloc</span>.showMessage(
            <span class="hljs-type" style="color: rgb(255, 198, 109);">GlobalMsg</span>(<span class="hljs-string" style="color: rgb(106, 135, 89);">"hello"</span>, bgColor: <span class="hljs-type" style="color: rgb(255, 198, 109);">Colors</span>.cyanAccent),
          );
        },
        child: <span class="hljs-type" style="color: rgb(255, 198, 109);">Icon</span>(<span class="hljs-type" style="color: rgb(255, 198, 109);">Icons</span>.ac_unit),
      ),
    );
  }
}
</pre>