class CommentPolicy < ApplicationPolicy
    attr_reader :account, :comment

    def initialize(account, comment)
        @account = account
        @comment = comment
    end

    def create?
        account_present?
    end

    private

    def account_present?
        account.present?
    end
end