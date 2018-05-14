require 'minitest/autorun'
require 'open3'

describe "checkstyle annotate plugin parser" do
  it "handles no errors" do
    output, status = Open3.capture2e("#{__dir__}/../bin/annotate", "#{__dir__}/no-errors/")

    assert_equal <<~OUTPUT, output
      Parsing checkstyle-1.xml
      Parsing checkstyle-2.xml
      --- ❓ Checking errors
      There were no errors 🙌
    OUTPUT

    assert_equal 0, status.exitstatus
  end

  it "handles multi-file errors" do
    output, status = Open3.capture2e("#{__dir__}/../bin/annotate", "#{__dir__}/multi-file-errors/")

    assert_equal <<~OUTPUT, output
Parsing checkstyle-1.xml
Parsing checkstyle-2.xml
--- ❓ Checking errors
There are 42 errors 😭
--- ✍️ Preparing annotation
42 errors
<details>
<summary><code>internal/testapp/api.go:285</code></summary>

<code><pre>lll: line is 102 characters</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:233</code></summary>

<code><pre>lll: line is 105 characters</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:185</code></summary>

<code><pre>lll: line is 102 characters</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:1</code></summary>

<code><pre>golint: package comment should be of the form \"Package testapp ...\"</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:374</code></summary>

<code><pre>dupl: duplicate of internal/testapp/api.go:310-320</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:310</code></summary>

<code><pre>dupl: duplicate of internal/testapp/api.go:374-384</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:220</code></summary>

<code><pre>vetshadow: declaration of \"mechanism\" shadows declaration at internal/testapp/api.go:26</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:124</code></summary>

<code><pre>vetshadow: declaration of \"mechanism\" shadows declaration at internal/testapp/api.go:26</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:434</code></summary>

<code><pre>lll: line is 101 characters</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:401</code></summary>

<code><pre>lll: line is 101 characters</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:323</code></summary>

<code><pre>lll: line is 116 characters</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:301</code></summary>

<code><pre>lll: line is 105 characters</pre></code>

</details>
<details>
<summary><code>internal/testapp/api.go:285</code></summary>

<code><pre>errcheck: error return value not checked (jsonparser.ArrayEach(data, func(value []byte, dataType jsonparser.ValueType, offset int, err error) {)</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:266</code></summary>

<code><pre>errcheck: error return value not checked (awsini.SaveTo(homeDir + \"/.aws/credentials\"))</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:263</code></summary>

<code><pre>errcheck: error return value not checked (awsini.NewSection(\"testapp-\" + username))</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:185</code></summary>

<code><pre>errcheck: error return value not checked (jsonparser.ArrayEach(data, func(value []byte, dataType jsonparser.ValueType, offset int, err error) {)</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:220</code></summary>

<code><pre>vetshadow: declaration of \"mechanism\" shadows declaration at internal/testapp/api.go:26</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:189</code></summary>

<code><pre>unconvert: unnecessary conversion</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:187</code></summary>

<code><pre>unconvert: unnecessary conversion</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:1</code></summary>

<code><pre>golint: package comment should be of the form \"Package testapp ...\"</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:401</code></summary>

<code><pre>lll: line is 101 characters</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:301</code></summary>

<code><pre>megacheck: should omit comparison to bool constant, can be simplified to !strings.Contains(app.DisplayName, \"Break\") (S1002)</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:286</code></summary>

<code><pre>unconvert: unnecessary conversion</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:343</code></summary>

<code><pre>errcheck: error return value not checked (xml.Unmarshal(samlDecoded, &xmlData))</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:122</code></summary>

<code><pre>megacheck: should omit comparison to bool constant, can be simplified to !testappAttemptPreAuth(appFlag) (S1002)</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:405</code></summary>

<code><pre>errcheck: error return value not checked (awsini.SaveTo(homeDir + \"/.aws/credentials\"))</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:323</code></summary>

<code><pre>lll: line is 116 characters</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:438</code></summary>

<code><pre>errcheck: error return value not checked (awsini.SaveTo(homeDir + \"/.aws/credentials\"))</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:434</code></summary>

<code><pre>lll: line is 101 characters</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:447</code></summary>

<code><pre>errcheck: error return value not checked (awsini.SaveTo(homeDir + \"/.aws/credentials\"))</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:186</code></summary>

<code><pre>unconvert: unnecessary conversion</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:310</code></summary>

<code><pre>dupl: duplicate of internal/testapp/api.go:374-384</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:188</code></summary>

<code><pre>unconvert: unnecessary conversion</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:374</code></summary>

<code><pre>dupl: duplicate of internal/testapp/api.go:310-320</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:223</code></summary>

<code><pre>unconvert: unnecessary conversion</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:185</code></summary>

<code><pre>lll: line is 102 characters</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:287</code></summary>

<code><pre>unconvert: unnecessary conversion</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:233</code></summary>

<code><pre>lll: line is 105 characters</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:162</code></summary>

<code><pre>megacheck: should use 'return <expr>' instead of 'if <expr> { return <bool> }; return <bool>' (S1008)</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:285</code></summary>

<code><pre>lll: line is 102 characters</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:124</code></summary>

<code><pre>vetshadow: declaration of \"mechanism\" shadows declaration at internal/testapp/api.go:26</pre></code>

</details>

<details>
<summary><code>internal/testapp/api.go:301</code></summary>

<code><pre>lll: line is 105 characters</pre></code>

</details>
    OUTPUT
    assert_equal 0, status.exitstatus
  end
end
