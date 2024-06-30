#import "../util/typst.typ"
#import "elements.typ": package

#let _type-map = (
  "auto": "foundations/auto",
  "none": "foundations/none",

  // foundation
  arguments: "foundations/arguments",
  array: "foundations/array",
  boolean: "foundations/bool",
  bytes: "foundations/bytes",
  content: "foundations/content",
  datetime: "foundations/datetime",
  dictionary: "foundations/dictionary",
  float: "foundations/float",
  function: "foundations/function",
  integer: "foundations/int",
  location: "foundations/location",
  plugin: "foundations/plugin",
  regex: "foundations/regex",
  selector: "foundations/selector",
  string: "foundations/str",
  type: "foundations/type",
  label: "foundations/label",
  version: "foundations/version",

  // layout
  alignment: "layout/alignment",
  angle: "layout/angle",
  direction: "layout/direction",
  fraction: "layout/fraction",
  length: "layout/length",
  ratio: "layout/ratio",
  relative: "layout/relative",

  // visualize
  color: "visualize/color",
  gradient: "visualize/gradient",
  stroke: "visualize/stroke",
)

#let _builtin-map = (
  raw: "text/raw",
)


#let link-docs(..path) = typst.link("https://typst.app/docs/reference/" + path.pos().first(), ..path.pos().slice(1))

#let link-dtype(..name) = link-docs(_type-map.at(name.pos().first(), default: ""), ..name.pos().slice(1))

#let link-builtin(..name) = link-docs(_builtin-map.at(name.pos().first(), default: ""), ..name.pos().slice(1))

#let link(..args) = {
  let dest = args.pos().first()
  let body = if args.pos().len() > 1 {
    args.pos().at(1)
  } else {
    dest
  }
  if "footnote" in args.named() and not args.named().at("footnote") {
    [#typst.link(dest, body)]
  } else {
    [#typst.link(dest, body)<mantys:link>]
  }
}

#let github(repo) = link("https://github.com/" + repo, repo)
#let universe(pkg) = link("https://typst.app/universe/package/" + pgk, package(pkg))
#let preview(pkg, version: none) = link(
  "https://github.com/typst/packages/tree/main/packages/preview/" + pgk + if version != none {
    "/" + str(version)
  } else {
    ""
  },
  package(pkg),
)
