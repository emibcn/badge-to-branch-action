# Badge action - Save to dedicated branch

This action generates a SVG badge using GitHub Actions and GitHub Workflow CPU time (no 3rd parties servers). The badge is generated using the NPM package [gradient-badge](https://github.com/bokub/gradient-badge) by [`badge-action`](https://github.com/emibcn/badge-action). Once the badge is generated, save it into a dedicated branch on the same repository.

This is a composite action. Most of its inputs are passed through to (from [`badge-action`](https://github.com/emibcn/badge-action)).

## Inputs

### `label`

**Required** The left label of the badge, usually static.

### `label-color`

**Required** Hex or named color for the label. Default: `555`

### `status`

**Required** The right status as the badge, usually based on results.

### `color`

**Required** An array (comma separated) with hex or named colors of the badge value background. More than one creates gradient background. Default: `blue`.

### `style`

**Required** Badge style: flat or classic. Default: `classic`

### `icon`

Use icon.

### `icon-width`

Set this if icon is not square. Default: `13`

### `scale`

Set badge scale. Default: `1`

### `filename`

File name for the generated SVG image (for example: `test-coverage.svg`).

### `path`

The path to store the badges branch while creating and commiting. Defaults to `badges`.

### `branch`

Branch to store the badges images. Defaults to `badges`.

### `github_token`

The `GITHUB_TOKEN` used to push the commit with the generated badge. Use `${{ secrets.GITHUB_TOKEN }}`.

## Outputs

### `badge`

The badge SVG contents.

### `public_url`

The public URL for the generated badge.

## Example usage

```
uses: emibcn/badge-to-branch-action@v1
with:
  label: 'Test coverage'
  status: '53.4%'
  color: 'blue,555,daf'
```
