/// join list of strings by comma
/// -> str
#let join-comma(list) = {
  if list.len() == 2 {
    list.join(" and ")
  } else {
    list.join(", ")
  }
}

/// Get label by different language
/// -> str
#let label-diff-lang(
  /// Key to retrieve
  /// -> str: "abstract"/"keywords"
  key,
  /// Language
  /// fall back to "en"
  /// -> str: "zh"/"en"
  lang: "en",
) = {
  let labels = (
    "en": (
      "abstract": "Abstract. ",
      "keywords": "Keywords. ",
    ),
    "zh": (
      "abstract": "摘要: ",
      "keywords": "关键词: ",
    ),
  )
  labels.at(lang).at(key)
}
