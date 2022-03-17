module Pubid::Ieee
  class Parser < Parslet::Parser
    rule(:digits) do
      match('\d').repeat(1)
    end

    rule(:year) do
      (str(".") | str("-")) >> match('\d').repeat(4, 4).as(:year)
    end

    rule(:organization) do
      str("IEEE") | str("AIEE") | str("ANSI") | str("ASA") | str("NCTA") | str("IEC") | str("ISO")
    end

    rule(:number) do
      (digits | match("[A-Z]")).repeat(1).as(:number)
    end

    rule(:part) do
      (str(".") | str("-")) >> match('[\dA-Z]').repeat(1).as(:part)
    end

    rule(:subpart) do
      (str(".") | str("-")) >> match('\d').repeat(1)
    end

    rule(:type) do
      str("Std") | str("STD") | str("Standard") | str("Draft Std") | str("Draft")
    end

    rule(:edition) do
      (str(", ") >> match('\d').repeat(4, 4).as(:year) >> str(" Edition")) |
        ((str(" ") | str("-")) >> str("Edition ") >> (digits >> str(".") >> digits).as(:version) >> (str(" - ") | str(" ")) >>
        match('\d').repeat(4, 4).as(:year) >> (str("-") >>
        match('\d').repeat(2, 2).as(:month)).maybe) |
        #, February 2018 (E)
        (str(", ") >> match('[a-zA-Z]').repeat(1).as(:month) >> str(" ") >> match('\d').repeat(4, 4).as(:year) >>
          str(" (E)")) |
        # First edition 2002-11-01
        str(" ") >> str("First").as(:version) >>
        str(" edition ") >>
          match('\d').repeat(4, 4).as(:year) >> str("-") >>
          match('\d').repeat(2, 2).as(:month) >> (str("-") >>
          match('\d').repeat(2, 2).as(:day)).maybe

    end

    rule(:identifier) do
      organization.as(:publisher) >> ((str("/ ") | str("/")) >> organization.as(:copublisher)).repeat >>
        str(" ") >> (type.as(:type) >> str(" ")).maybe >> (
        (str("No") | str("no")) >> (str(".") | str(" "))
      ).maybe >> str(" ").maybe >>
      number >>
        # patterns:
        (
          # 802.15.22.3-2020
          # 1073.1.1.1-2004
          (part >> subpart.repeat(2, 2).as(:subpart) >> year) |
          # C57.12.00-1993
          (part >> subpart.as(:subpart) >> year) |
          # N42.44-2008
          # 1244-5.2000
          # 11073-40102-2020
          # C37.0781-1972
          (part >> year) |
          # C57.19.101
          (part >> subpart) |
          # 581.1978
          year |
          # IEC 62525-Edition 1.0 - 2007
          edition.as(:edition) |
          # 61691-6
          part
        ).maybe >>
        edition.as(:edition).maybe >>
        (str(" ") >>
          ((str("(") >> (identifier.as(:alternative) >> str(", ").maybe).repeat(1) >> str(")")) |
           (str("and ") >> identifier.as(:alternative)))
        ).maybe
    end

    rule(:root) { identifier }
  end
end
