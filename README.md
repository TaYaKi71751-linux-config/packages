<h2>config/fusuma</h2>
<h4>Requirements</h4>
<pre><code>
<a
	href="https://docs.brew.sh/Homebrew-on-Linux"
	>brew</a> install \
	<a
		href="https://formulae.brew.sh/formula/ruby"
	>ruby</a>
</code></pre>
<pre><code>
<a
	href="https://github.com/rubygems/rubygems"
	>gem</a> install \
	<a
		href="https://github.com/iberianpig/fusuma"
	>fusuma</a>
</code></pre>
<h4>Config</h4>
<pre><code>
	git clone \
		-b <a
			href="https://github.com/raccl/packages/tree/config/fusuma"
		>config/fusuma</a> \
		https://github.com/<a
			href="https://github.com/raccl/packages"
		>raccl/packages</a>.git \
			~/.config/fusuma
</code></pre>
or
<pre><code>
curl -LsSf \
"https://github.com/\
<a
	href="https://github.com/raccl/packages"
>raccl/packages</a>\
/raw/\
<a
	href="https://github.com/raccl/packages/tree/config/fusuma"
>config/fusuma</a>\
/config.sh" | sh
</code></pre>
