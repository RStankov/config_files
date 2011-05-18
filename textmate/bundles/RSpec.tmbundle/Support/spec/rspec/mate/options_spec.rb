require 'spec_helper'

describe RSpec::Mate::Options do
  let(:options) do
    Class.new do
      include RSpec::Mate::Options
    end.new.send :options
  end

  def stub_file_with(lines)
    File.stub(:exist?) { true }
    File.stub(:readlines) { lines }
  end

  context "with no file" do
    it "is empty" do
      File.stub(:exist?) { false }
      options.should be_empty
    end
  end

  context "with a file" do
    context "with --rspec-version" do
      it "contains the rspec version" do
        stub_file_with ['--rspec-version 1.3.1']
        options['--rspec-version'].should eq('1.3.1')
      end
    end

    context "with --bundler" do
      it "contains bundler true" do
        stub_file_with ['--bundler']
        options['--bundler'].should be_true
      end
    end
  end
end
