library('readtext')
library('stringr')
generate_reference_list <- function(input_name) {
  text <- readtext(input_name)
  # remove new lines and replace by space
  text <- gsub("\r?\n|\r", " ", text$text)
  # replace square brackets with round brackets
  # this allows to correctly parse references that are links from markdown formatted text
  text <- gsub("\\[", "\\(", text)
  text <- gsub("\\]", "\\)", text)
  matches <- str_extract_all(text, "\\((.*?)\\)", TRUE)
  matches_containing_numbers <- matches[str_detect(matches, " [[:digit:]]{4}")]
  matches_without_special_chars <- matches_containing_numbers[str_detect(matches_containing_numbers, "\\\\|\\}|\\{", TRUE)]
  # TODO: fixup
  matches_with_letters_and_spaces <- matches_without_special_chars[str_detect(matches_without_special_chars,"[[:letter:]][,| ]")]
  # at this point we should only have matches that contain at least one valid reference
  # split them up at semicolons or commata
  split_references = str_split(matches_with_letters_and_spaces, ",|;", simplify = TRUE)
  
  references = vector()
  for (potential_reference in split_references){
    # contain four digits for a year
    # TODO: fixup
    if(str_detect(potential_reference, " [[:digit:]]{4}") && str_detect(potential_reference,"[[:letter:]][,| ]")){
      # remove all remaining brackets
      identified_reference <- gsub('\\(|\\)', "", potential_reference)
      identified_reference <- str_trim(identified_reference)
      references <- c(references,  identified_reference)
    }
  }
  unique_references <- unique(references)
  unique_sorted_references <- sort(unique_references)
  return (unique_sorted_references)
}