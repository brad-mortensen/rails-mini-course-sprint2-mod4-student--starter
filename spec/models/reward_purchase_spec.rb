require 'rails_helper'

RSpec.describe RewardPurchase do
  describe "#approved?" do
    let(:unavailable_reward) { double("Reward", cost: 100, available?: false) }
    let(:available_reward) { double("Reward", cost: 100, available?: true) }

    context "employee can't afford" do
      let(:employee) { double("Employee", can_afford?: false, )}

      context "reward is available" do
        it "is not approved" do
          result = RewardPurchase.new(employee, available_reward).approved?

          expect(result).to be false
        end
      end

      context "reward is unavailable" do
        it "is not approved" do
          result = RewardPurchase.new(employee, unavailable_reward).approved?

          expect(result).to be false
        end
      end
    end

    context "employee can afford" do
      let(:employee) { double("Employee", can_afford?: true, )}

      context "reward is unavailable" do
        it "is not approved" do
          result = RewardPurchase.new(employee, unavailable_reward).approved?

          expect(result).to be false
        end
      end

      context "reward is available" do
        it "is approved" do
          result = RewardPurchase.new(employee, available_reward).approved?

          expect(result).to be true
        end
      end
    end
  end

  describe "#notify" do
    let(:reward) { double("Reward", id: 17) }
    let(:employee) { double("Employee", id: 21) }

    context "with a mock" do
      it "should call the service with the employee id and reward id" do
        expect(NotificationService).to receive(:send_purchase_approval).with(employee.id, reward.id)

        RewardPurchase.new(employee, reward).notify
      end
    end

    context "with a spy" do
      it "should call the service with the employee id and reward id" do
        allow(NotificationService).to receive(:send_purchase_approval)

        RewardPurchase.new(employee, reward).notify

        expect(NotificationService).to have_received(:send_purchase_approval).with(employee.id, reward.id)
      end
    end
  end
end