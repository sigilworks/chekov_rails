# factories.rb

FactoryGirl.define do
    factory :user do
        sequence(:name)  { |n| "Person #{n}" }
        sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar123"
        password_confirmation "foobar123"

        factory :admin do
        admin true
        end
    end

    factory :comment do
        sequence(:usr_id) { |n| n }
        sequence(:upd_id) { |n| n }
        sequence(:com_id) { |n| n }

        content "Lorem Ipsum"

        factory :usr_1 do
        usr_id 1
        end

    factory :usr_2 do
        usr_id 2
    end

    factory :upd_1 do
        upd_id 1
    end

    factory :upd_2 do
        upd_id 2
    end


    end

    factory :pin do
        description "Build the next Facebook"
        user
    end
end


# spec/models/who_rated_comment_rel_spec.rb:

require 'spec_helper'


describe WhoRatedCommentRel do
    let(:user)    { FactoryGirl.create(:user) }
    let(:comment) { FactoryGirl.create(:comment) }
    let(:voting_rel) do
    user.who_rated_comment_rels.build(comment_id: comment.id)
end

subject { voting_rel }

it { should be_valid }


describe "follower methods" do

    it { should respond_to(:user_id) }
    it { should respond_to(:comment_id) }
    its(:comment) { should eq comment }
    its(:user)    { should eq user }
  end
end