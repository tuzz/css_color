require "spec_helper"

describe CSSColor do

  # W3C color grammar, used for reference:
  # color    ::= "#" hexdigit hexdigit hexdigit (hexdigit hexdigit hexdigit)?
  #             | "rgb(" wsp* integer comma integer comma integer wsp* ")"
  #             | "rgb(" wsp* integer "%" comma integer "%" comma integer "%" wsp* ")"
  #             | color-keyword
  # hexdigit ::= [0-9A-Fa-f]
  # comma    ::= wsp* "," wsp*

  it "parses the readme examples" do
    p("#fff").should == "#ffffff"
    p("blue").should == "#0000ff"
    p("rgb(0, 0, 0)").should == "#000000"
    p("rgb(50%, 50%, 50%)").should == "#808080"
  end

  it "raises a custom error for garbage" do
    expect {
      p("this isn't a color")
    }.to raise_error(CSSColor::UnknownColorError, /isn't/)

    expect {
      p("#12345678")
    }.to raise_error(CSSColor::UnknownColorError, /345/)

    expect {
      p("rgb(100, 100)")
    }.to raise_error(CSSColor::UnknownColorError, /100/)

    expect {
      p("rgb(256, 0, 0)")
    }.to raise_error(CSSColor::UnknownColorError, /256/)

    expect {
      p("rgb(-1, 0, 0)")
    }.to raise_error(CSSColor::UnknownColorError, /-1/)

    expect {
      p("rgb(110%, 0%, 0%)")
    }.to raise_error(CSSColor::UnknownColorError, /110/)
  end

  # "#" hexdigit hexdigit hexdigit (hexdigit hexdigit hexdigit)?
  describe "hexadecimals" do
    it "parses three-letter hexadecimals" do
      p("#089").should == "#008899"
      p("#F3c").should == "#ff33cc"
    end

    it "parses six-letter hexadecimals" do
      p("#ffffff").should == "#ffffff"
      p("#1234fE").should == "#1234fe"
    end
  end

  describe "rgb" do
    # "rgb(" wsp* integer comma integer comma integer wsp* ")"
    it "parses integer rgbs" do
      p("rgb(255, 255, 255)").should == "#ffffff"
      p("RGB(  0,   1,   2)").should == "#000102"
    end

    # "rgb(" wsp* integer "%" comma integer "%" comma integer "%" wsp* ")"
    it "parses percentage rgbs" do
      p("rgb(10%, 20%, 30%)").should == "#1a334d"
      p("Rgb( 0%, 100%, 50%)").should == "#00ff80"
    end
  end

  # color-keyword
  it "parses color keywords" do
    p("gold").should == "#ffd700"
    p("Ivory").should == "#fffff0"
    p("ORCHID").should == "#da70d6"
  end

  it "parses rgba, hsl, hsla" # Implement me.

end
