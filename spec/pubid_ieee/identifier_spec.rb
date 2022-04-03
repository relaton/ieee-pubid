RSpec.describe Pubid::Ieee::Identifier do
  subject { described_class.parse(original) }

  let(:original) { pubid }
  let(:full_pubid) { nil }

  def context_description(ex)
    ex.example_group.metadata[:parent_example_group][:description_args].first
  end

  shared_examples "converts pubid to pubid" do
    it "converts pubid to pubid" do |ex|
      # identifier = described_class.parse(
      #   context_description(ex)
      # )
      expect(subject.to_s).to eq(pubid)
    end

    it "converts to full pubid" do
      expect(subject.to_s(:full)).to eq(full_pubid) if full_pubid
    end
  end

  context "IEEE No 142-1956" do
    let(:original) { "IEEE No 142-1956" }
    let(:pubid) { "IEEE 142-1956" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 802.15.22.3-2020" do
    let(:pubid) { "IEEE Std 802.15.22.3-2020" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 1244-5.2000" do
    let(:original) { "IEEE Std 1244-5.2000" }
    let(:pubid) { "IEEE Std 1244-5-2000" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 581.1978" do
    let(:original) { "IEEE Std 581.1978" }
    let(:pubid) { "IEEE Std 581-1978" }

    it_behaves_like "converts pubid to pubid"
  end

  context "ANSI C37.0781-1972" do
    let(:pubid) { "ANSI C37.0781-1972" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 1003.0-1995" do
    let(:pubid) { "IEEE Std 1003.0-1995" }

    it_behaves_like "converts pubid to pubid"
  end

  context "ASA C37.1-1950" do
    let(:pubid) { "ASA C37.1-1950" }

    it_behaves_like "converts pubid to pubid"
  end

  context "ANSI/ IEEE C37.23-1969" do
    let(:original) { "ANSI/ IEEE C37.23-1969" }
    let(:pubid) { "ANSI/IEEE C37.23-1969" }

    it_behaves_like "converts pubid to pubid"
  end

  context "AIEE No 91-1962 (ASA Y32.14-1962)" do
    let(:original) { "AIEE No 91-1962 (ASA Y32.14-1962)" }
    let(:pubid) { "AIEE 91-1962 (ASA Y32.14-1962)" }

    it_behaves_like "converts pubid to pubid"
  end

  context "ANSI C37.61-1973 and IEEE Std 321-1973" do
    let(:original) { "ANSI C37.61-1973 and IEEE Std 321-1973" }
    let(:pubid) { "ANSI C37.61-1973 (IEEE Std 321-1973)" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 623-1976 (ANSI Y32.21-1976, NCTA 006-0975)" do
    let(:pubid) { "IEEE Std 623-1976 (ANSI Y32.21-1976, NCTA 006.0975)" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEC 61671-2 Edition 1.0 2016-04" do
    let(:original) { "IEC 61671-2 Edition 1.0 2016-04" }
    let(:pubid) { "IEC 61671-2 Edition 1.0 2016-04" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEC/IEEE 60076-16 Edition 2.0 2018-09" do
    let(:original) { "IEC/IEEE 60076-16 Edition 2.0 2018-09" }
    let(:pubid) { "IEC/IEEE 60076-16 Edition 2.0 2018-09" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 1003.1, 2004 Edition" do
    let(:original) { "IEEE Std 1003.1, 2004 Edition" }
    let(:pubid) { "IEEE Std 1003.1 Edition 2004" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEC 62525-Edition 1.0 - 2007" do
    let(:original) { "IEC 62525-Edition 1.0 - 2007" }
    let(:pubid) { "IEC 62525 Edition 1.0 2007" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE/ISO/IEC P90003, February 2018 (E)" do
    let(:original) { "IEEE/ISO/IEC P90003, February 2018 (E)" }
    let(:pubid) { "IEEE/ISO/IEC P90003 Edition 2018-02" }

    it_behaves_like "converts pubid to pubid"
  end

  context "ISO/IEC 15288 First edition 2002-11-01" do
    let(:original) { "ISO/IEC 15288 First edition 2002-11-01" }
    let(:pubid) { "ISO/IEC 15288 Edition 1.0 2002-11-01" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEC 61523-3 First edition 2004-09" do
    let(:original) { "IEC 61523-3 First edition 2004-09" }
    let(:pubid) { "IEC 61523-3 Edition 1.0 2004-09" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE 1076.4 IEC 61691-5 First edition 2004-10" do
    let(:original) { "IEEE 1076.4 IEC 61691-5 First edition 2004-10" }
    let(:pubid) { "IEEE 1076.4 (IEC 61691-5 Edition 1.0 2004-10)" }

    it_behaves_like "converts pubid to pubid"
  end

  context "ANSI PC63.10/D14, April 2020" do
    let(:pubid) { "ANSI PC63.10/D14, April 2020" }
    let(:full_pubid) { "ANSI Draft PC63.10/D14, April 2020" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 1076.1 IEC 61691-6 Edition 1.0 2009-12" do
    let(:original) { "IEEE Std 1076.1 IEC 61691-6 Edition 1.0 2009-12" }
    let(:pubid) { "IEEE Std 1076.1 (IEC 61691-6 Edition 1.0 2009-12)" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std PC37.12.1/D2.0" do
    let(:pubid) { "IEEE Std PC37.12.1/D2.0" }
    let(:full_pubid) { "IEEE Draft Std PC37.12.1/D2.0" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE 1250 /D11 May 2010" do
    let(:original) { "IEEE 1250 /D11 May 2010" }
    let(:pubid) { "IEEE 1250/D11, May 2010" }

    it_behaves_like "converts pubid to pubid"
  end

  context "ANSI PC63.12/D12e, January 2015" do
    let(:pubid) { "ANSI PC63.12/D12e, January 2015" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE P62.44/D15.3" do
    let(:pubid) { "IEEE P62.44/D15.3" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE C57.139/D14June 2010" do
    let(:pubid) { "IEEE C57.139/D14, June 2010" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE P11073-10101/D3r7, September 2018" do
    let(:original) { "IEEE P11073-10101/D3.7, September 2018" }
    let(:pubid) { "IEEE P11073-10101/D3.7, September 2018" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE P11073-10420/D4D5, March 2020" do
    let(:original) { "IEEE P11073-10420/D4D5, March 2020" }
    let(:pubid) { "IEEE P11073-10420/D4D5, March 2020" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE P1293/D29a1, August 2018" do
    let(:pubid) { "IEEE P1293/D29a1, August 2018" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE P1609.2.1/D12D14, June 2020" do
    let(:original) { "IEEE P1609.2.1/D12D14, June 2020" }
    let(:pubid) { "IEEE P1609.2.1/D12D14, June 2020" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE P1653.5/D7d1 November, 2019" do
    let(:original) { "IEEE P1653.5/D7d1 November, 2019" }
    let(:pubid) { "IEEE P1653.5/D7.1, November 2019" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE P1017/D062012" do
    let(:original) { "IEEE P1017/D062012" }
    let(:pubid) { "IEEE P1017/D062012, June 2012" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std PC37.20.1a/D11" do
    let(:pubid) { "IEEE Std PC37.20.1a/D11" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std PC37.66/D12, Apr 2005" do
    let(:pubid) { "IEEE Std PC37.66/D12, April 2005" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Unapproved Draft Std 11073-10471/D02, Feb 2008" do
    let(:original) { "IEEE Unapproved Draft Std 11073-10471/D02, Feb 2008" }
    let(:pubid) { "IEEE Std 11073-10471/D02, February 2008" }
    let(:full_pubid) { "IEEE Unapproved Draft Std 11073-10471/D02, February 2008" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Active Unapproved Draft Std PC37.59/D11, Jul 2007" do
    let(:original) { "IEEE Active Unapproved Draft Std PC37.59/D11, Jul 2007" }
    let(:pubid) { "IEEE Std PC37.59/D11, July 2007" }
    let(:full_pubid) { "IEEE Active Unapproved Draft Std PC37.59/D11, July 2007" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Approved Draft Std P1076.1/D3.3, Feb 6, 2007" do
    let(:original) { "IEEE Approved Draft Std P1076.1/D3.3, Feb 6, 2007" }
    let(:pubid) { "IEEE Std P1076.1/D3.3, February 6, 2007" }
    let(:full_pubid) { "IEEE Approved Draft Std P1076.1/D3.3, February 6, 2007" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Unapproved Draft Std P11073-20601_D20 May 2008" do
    let(:original) { "IEEE Unapproved Draft Std P11073-20601_D20 May 2008" }
    let(:pubid) { "IEEE Std P11073-20601/D20, May 2008" }
    let(:full_pubid) { "IEEE Unapproved Draft Std P11073-20601/D20, May 2008" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Unapproved Draft Std P1616a/D4, Jan 2010" do
    let(:original) { "IEEE Unapproved Draft Std P1616a/D4, Jan 2010" }
    let(:pubid) { "IEEE Std P1616a/D4, January 2010" }
    let(:full_pubid) { "IEEE Unapproved Draft Std P1616a/D4, January 2010" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Unapproved Draft Std P1619/D17, Jul 07" do
    let(:original) { "IEEE Unapproved Draft Std P1619/D17, Jul 07" }
    let(:pubid) { "IEEE Std P1619/D17, July 2007" }
    let(:full_pubid) { "IEEE Unapproved Draft Std P1619/D17, July 2007" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Unapproved Std PC37.101/D13, Jun 2006" do
    let(:original) { "IEEE Unapproved Std PC37.101/D13, Jun 2006" }
    let(:pubid) { "IEEE Std PC37.101/D13, June 2006" }
    let(:full_pubid) { "IEEE Unapproved Draft Std PC37.101/D13, June 2006" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Unapproved Draft Std PC62.11a/D9E, Sept 2007" do
    let(:original) { "IEEE Unapproved Draft Std PC62.11a/D9E, Sept 2007" }
    let(:pubid) { "IEEE Std PC62.11a/D9E, September 2007" }
    let(:full_pubid) { "IEEE Unapproved Draft Std PC62.11a/D9E, September 2007" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Unapproved Draft Std 802.20/D4.1m, April 2008" do
    let(:original) { "IEEE Unapproved Draft Std 802.20/D4.1m, April 2008" }
    let(:pubid) { "IEEE Std 802.20/D4.1m, April 2008" }
    let(:full_pubid) { "IEEE Unapproved Draft Std 802.20/D4.1m, April 2008" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Unapproved Draft Std P1003.1_D4 , Jan 2008" do
    let(:original) { "IEEE Unapproved Draft Std P1003.1_D4 , Jan 2008" }
    let(:pubid) { "IEEE Std P1003.1/D4, January 2008" }
    let(:full_pubid) { "IEEE Unapproved Draft Std P1003.1/D4, January 2008" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Unapproved Draft Std P11073-20601a/D13, Jan 2010" do
    let(:original) { "IEEE Unapproved Draft Std P11073-20601a/D13, Jan 2010" }
    let(:full_pubid) { "IEEE Unapproved Draft Std P11073-20601a/D13, January 2010" }
    let(:pubid) { "IEEE Std P11073-20601a/D13, January 2010" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 1491-2012 (Revision of IEEE Std 1491-2005)" do
    let(:pubid) { "IEEE Std 1491-2012 (Revision of IEEE Std 1491-2005)" }

    it_behaves_like "converts pubid to pubid"
  end

  context "ANSI C63.10-2013 - Redline" do
    let(:pubid) { "ANSI C63.10-2013 - Redline" }

    it_behaves_like "converts pubid to pubid"
  end

  context "PC57.158/D6A, August 2016" do
    let(:original) { "PC57.158/D6A, August 2016" }
    let(:pubid) { "IEEE PC57.158/D6A, August 2016" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEP62.42.1/D3, October 2014" do
    let(:original) { "IEEP62.42.1/D3, October 2014" }
    let(:pubid) { "IEEE P62.42.1/D3, October 2014" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE No. 264-1968" do
    let(:original) { "IEEE No. 264-1968" }
    let(:pubid) { "IEEE 264-1968" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 1666 IEC61691-7 Edition 1.0 2009-12" do
    let(:original) { "IEEE Std 1666 IEC61691-7 Edition 1.0 2009-12" }
    let(:pubid) { "IEEE Std 1666 (IEC 61691-7 Edition 1.0 2009-12)" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE No 323, April 1971" do
    let(:original) { "IEEE No 323, April 1971" }
    let(:pubid) { "IEEE 323-1971" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE P15026-2, April 2011" do
    let(:original) { "IEEE P15026-2, April 2011" }
    let(:pubid) { "IEEE P15026-2-2011" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE P90003-2014, April 2015" do
    let(:original) { "IEEE P90003-2014, April 2015" }
    let(:pubid) { "IEEE P90003-2015 (Adoption of IEEE P90003-2014)" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE/IEC P60076-57-1202, July 2014" do
    let(:original) { "IEEE/IEC P60076-57-1202, July 2014" }
    let(:pubid) { "IEEE/IEC P60076-57-1202-2014" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE P802.11ajD8.0, August 2017" do
    let(:original) { "IEEE P802.11ajD8.0, August 2017" }
    let(:pubid) { "IEEE P802.11aj/D8.0, August 2017" }

    it_behaves_like "converts pubid to pubid"
  end

  context "ISO/IEC/IEEE P26513_D2, January 2017" do
    let(:original) { "ISO/IEC/IEEE P26513_D2, January 2017" }
    let(:pubid) { "ISO/IEC/IEEE P26513/D2, January 2017" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE P2410-D4, July 2019" do
    let(:original) { "IEEE P2410-D4, July 2019" }
    let(:pubid) { "IEEE P2410/D4, July 2019" }

    it_behaves_like "converts pubid to pubid"
  end

  context "ANSI C63.4a-2017 (Amendment to ANSI C63.4-2014)" do
    let(:original) { "ANSI C63.4a-2017 (Amendment to ANSI C63.4-2014)" }
    let(:pubid) { "ANSI C63.4a-2017 (Amendment to ANSI C63.4-2014)" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE P802.3bg/D2.1, September 2010 (Amendment of IEEE Std 802.3-2008)" do
    let(:original) { "IEEE P802.3bg/D2.1, September 2010 (Amendment of IEEE Std 802.3-2008)" }
    let(:pubid) { "IEEE P802.3bg/D2.1, September 2010 (Amendment to IEEE Std 802.3-2008)" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 802.15.3f-2017 (Amendment to IEEE Std 802.15.3-2016 as "\
          "amended by IEEE Std 802.15.3d-2017, and IEEE Std 802.15.3e-2017)" do
    let(:pubid) do
      "IEEE Std 802.15.3f-2017 (Amendment to IEEE Std 802.15.3-2016 as amended by IEEE Std 802.15.3d-2017, and IEEE Std 802.15.3e-2017)"
    end

    it_behaves_like "converts pubid to pubid"

  end

  context "IEEE Std 802.15.3d-2017 (Amendment to IEEE Std 802.15.3-2016 as amended by IEEE Std 802.15.3e-2017)" do
    let(:pubid) do
      "IEEE Std 802.15.3d-2017 (Amendment to IEEE Std 802.15.3-2016 as amended by IEEE Std 802.15.3e-2017)"
    end

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 802.15.3f-2017 (Amendment to IEEE Std 802.15.3-2016 as amended by IEEE Std 802.15.3d-2017, and IEEE Std 802.15.3e-2017)" do
    let(:pubid) do
      "IEEE Std 802.15.3f-2017 (Amendment to IEEE Std 802.15.3-2016 as amended by IEEE Std 802.15.3d-2017, and IEEE Std 802.15.3e-2017)"
    end

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 802.11af-2013 (Amendment to IEEE Std 802.11-2012, as amended by IEEE Std 802.11ae-2012,"\
          " IEEE Std 802.11aa-2012, IEEE Std 802.11ad-2012, and IEEE Std 802.11ac-2013)" do
    let(:original) do
      "IEEE Std 802.11af-2013 (Amendment to IEEE Std 802.11-2012, as amended by IEEE Std 802.11ae-2012,"\
        " IEEE Std 802.11aa-2012, IEEE Std 802.11ad-2012, and IEEE Std 802.11ac-2013)"
    end

    let(:pubid) do
      "IEEE Std 802.11af-2013 (Amendment to IEEE Std 802.11-2012 as amended by IEEE Std 802.11ae-2012,"\
        " IEEE Std 802.11aa-2012, IEEE Std 802.11ad-2012, and IEEE Std 802.11ac-2013)"
    end

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 1003.1-2001/Cor 2-2004" do
    let(:pubid) { "IEEE Std 1003.1-2001/Cor 2-2004" }

    it_behaves_like "converts pubid to pubid"
  end

  context "P1900.6-2011/Cor1/D3, August 2015" do
    let(:original) { "P1900.6-2011/Cor1/D3, August 2015" }
    let(:pubid) { "IEEE P1900.6-2011/Cor 1/D3, August 2015" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE P1722-2016-Cor1/D0, June 2016" do
    let(:original) { "IEEE P1722-2016-Cor1/D0, June 2016" }
    let(:pubid) { "IEEE P1722-2016/Cor 1/D0, June 2016" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 268-1979 (Supersedes IEEE Std 268-1976)" do
    let(:pubid) { "IEEE Std 268-1979 (Supersedes IEEE Std 268-1976)" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 16-1955 (Supersedes C48-1931 and AIEE 16A 1951)" do
    let(:original) { "IEEE Std 16-1955 (Supersedes C48-1931 and AIEE 16A-1951)" }
    let(:pubid) { "IEEE Std 16-1955 (Supersedes IEEE C48-1931 and AIEE 16A-1951)" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 588-1976 (ANSI C37.86-1975) (Revision of IEEE Std 288-1969 and IEEE Std 328-1971)" do
    let(:pubid) { "IEEE Std 588-1976 (ANSI C37.86-1975) (Revision of IEEE Std 288-1969 and IEEE Std 328-1971)" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std 268-1976 (Supersedes ASTM E380-1974 IEEE Std 268-1973 IEEE Std 322-1971)" do
    let(:original) { "IEEE Std 268-1976 (Supersedes ASTM E380-1974 IEEE Std 268-1973 IEEE Std 322-1971)" }
    let(:pubid) { "IEEE Std 268-1976 (Supersedes ASTM E380-1974, IEEE Std 268-1973, IEEE Std 322-1971)" }

    it_behaves_like "converts pubid to pubid"
  end

  context "IEEE Std C57.12.10-2013 (Corrigendum to IEEE Std C57.12.10-2010)" do
    let(:original) { "IEEE Std C57.12.10-2013 (Corrigendum to IEEE Std C57.12.10-2010)" }
    let(:pubid) { "IEEE Std C57.12.10-2010/Cor 1-2013" }

    it_behaves_like "converts pubid to pubid"
  end
end
