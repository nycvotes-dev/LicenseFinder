require "spec_helper"

module LicenseFinder
  describe BundleSyncer do
    describe "#sync!" do
      it "saves new, updates old, and destroys obsolete gems" do
        current_dependencies = stub
        Bundle.stub(:current_gem_dependencies).and_return { current_dependencies }
        Dependency.should_receive(:destroy_obsolete).with(current_dependencies)

        BundleSyncer.sync!
      end
    end
  end
end

