require "ordinalize_full/integer"

describe OrdinalizeFull do
  describe "#ordinalize_in_full" do
    context "with the default locale (:en)" do
      before { I18n.locale = :en }

      specify { expect(1.ordinalize_in_full).to eq("first") }
      specify { expect(42.ordinalize_in_full).to eq("forty second") }
    end

    context "with locale = :fr" do
      before { I18n.locale = :fr }

      specify { expect(1.ordinalize_in_full).to eq("premier") }
      specify { expect(42.ordinalize_in_full).to eq("quarante-deuxième") }
    end

    it "raises for unknown locales" do
      I18n.locale = :zz
      expect { 1.ordinalize_in_full }.to raise_error(NotImplementedError)
    end
  end

  describe "#ordinalize_full" do
    specify { expect(1.ordinalize_full).to eq(1.ordinalize_in_full) }
  end

  describe "#ordinalize" do
    context "with the default locale (:en)" do
      before { I18n.locale = :en }

      specify { expect(1.ordinalize(in_full: true)).to eq("first") }
      specify { expect(1.ordinalize(in_full: false)).to eq("1st") }
    end

    context "with locale = :fr" do
      before { I18n.locale = :fr }

      specify { expect(1.ordinalize(in_full: true)).to eq("premier") }
      specify { expect(1.ordinalize(in_full: false)).to eq("1er") }
    end

    it "raises for unknown locales" do
      I18n.locale = :zz
      expect { 1.ordinalize(in_full: false) }.to raise_error(NotImplementedError)
    end
  end
end
