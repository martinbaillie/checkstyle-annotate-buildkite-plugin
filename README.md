# Checkstyle Annotate Buildkite Plugin

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) that parses Checkstyle  XML artifacts (generated across any number of parallel steps) and creates a [build annotation](https://buildkite.com/docs/agent/v3/cli-annotate) listing the individual tests that errored.

## Example

The following pipeline will run `test.sh` jobs in parallel, and then process all the resulting Checkstyle XML files to create a summary build annotation.

```yml
steps:
  - command: test.sh
    parallelism: 50
    artifact_paths: tmp/checkstyle-*.xml
  - wait: ~
    continue_on_failure: true
  - plugins:
      - checkstyle-annotate:
          artifacts: tmp/checkstyle-*.xml
```

## Configuration

### `artifacts` (required)

The artifact glob path to find the Checkstyle XML files.

Example: `tmp/checkstyle-*.xml`

## Developing

To test the Ruby parser locally:

```bash
cd ruby
rake
```

## License

MIT (see [LICENSE](LICENSE))
