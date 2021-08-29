module Template
  def template(source_template, req_id)
    # Use Ruby sub method to replace first instance of %CODE% and %ALTCODE%
    # Could be a more readable solution, but this will work 
    source_template
      .sub(
        "%CODE%", req_id
      )
      .sub(
        "%ALTCODE%", (req_id[0..4] + "-" + req_id[5..7])
      )
  end
end
