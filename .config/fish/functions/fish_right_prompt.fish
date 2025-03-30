function fish_right_prompt -d "Write out the right prompt"
  set dur $CMD_DURATION

  if test $dur -lt 1000
    set dur $dur 'ms'
  else if test $dur -lt 60000
    set dur $(math $dur / 1000) 's'
  end


  echo $dur
end
