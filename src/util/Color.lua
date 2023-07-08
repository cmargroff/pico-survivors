function fg(text, color)
  return "\f"..color..text..""
end

function bg(text, color)
  print("\\#"..color..text)
  return "\#"..color..text
end
