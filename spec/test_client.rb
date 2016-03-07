describe "Test that client works" do
  it "returns 5566334149 and correct exit value" do
    expect { system("ruby client.rb apoex ab; echo $?") }.to output("5566334149\n0\n").to_stdout_from_any_process
  end

  it "returns not found message with correct exit value when searching for 'IckeExisterande AB'" do
    expect { system("ruby client.rb IckeExisterande AB; echo $?") }.to output("Company not found\n1\n").to_stdout_from_any_process
  end

  it "returns usage when run without parameters" do
    expect { system("ruby client.rb") }.to output("Usage: client.rb <company name>\n").to_stderr_from_any_process
  end
end
