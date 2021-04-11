require "rails_helper"

RSpec.describe HumanizedPassword do
  let(:context) { described_class.new(length: length).generate }

  context "small password (<9)" do
    describe "when password is 5 length" do
      let(:length) { 5 }

      include_examples "generates password with required length"
      include_examples "contains only letters"
    end

    describe "when password is 6 length" do
      let(:length) { 6 }

      include_examples "generates password with required length"
      include_examples "contains only letters"
    end

    describe "when password is 7 length" do
      let(:length) { 7 }

      include_examples "generates password with required length"
      include_examples "contains only letters"
    end

    describe "when password is 8 length" do
      let(:length) { 8 }

      include_examples "generates password with required length"
      include_examples "contains only letters"
    end
  end

  context "medium password (9-15 length)" do
    describe "when password is 9 length" do
      let(:length) { 9 }

      include_examples "generates password with required length"
      include_examples "contains letters with 1-3 digits"
    end

    describe "when password is 10 length" do
      let(:length) { 10 }

      include_examples "generates password with required length"
      include_examples "contains letters with 1-3 digits"
    end

    describe "when password is 11 length" do
      let(:length) { 11 }

      include_examples "generates password with required length"
      include_examples "contains letters with 1-3 digits"
    end

    describe "when password is 12 length" do
      let(:length) { 12 }

      include_examples "generates password with required length"
      include_examples "contains letters with 1-3 digits"
    end

    describe "when password is 13 length" do
      let(:length) { 13 }

      include_examples "generates password with required length"
      include_examples "contains letters with 1-3 digits"
    end

    describe "when password is 14 length" do
      let(:length) { 14 }

      include_examples "generates password with required length"
      include_examples "contains letters with 1-3 digits"
    end

    describe "when password is 15 length" do
      let(:length) { 15 }

      include_examples "generates password with required length"
      include_examples "contains letters with 1-3 digits"
    end
  end

  context "long password (16-20 length)" do
    describe "when password is 16 length" do
      let(:length) { 16 }

      include_examples "generates password with required length"
      include_examples "contains letters with 4-6 digits"
    end

    describe "when password is 17 length" do
      let(:length) { 17 }

      include_examples "generates password with required length"
      include_examples "contains letters with 4-6 digits"
    end

    describe "when password is 18 length" do
      let(:length) { 18 }

      include_examples "generates password with required length"
      include_examples "contains letters with 4-6 digits"
    end

    describe "when password is 19 length" do
      let(:length) { 19 }

      include_examples "generates password with required length"
      include_examples "contains letters with 4-6 digits"
    end

    describe "when password is 20 length" do
      let(:length) { 20 }

      include_examples "generates password with required length"
      include_examples "contains letters with 4-6 digits"
    end
  end
end
