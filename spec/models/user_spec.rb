require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'パスワードとパスワード（確認用）は6文字以上が入力されていれば、登録できる' do
        @user.password = '123aaaaaa'
        @user.password_confirmation = '123aaaaaa'
        expect(@user).to be_valid
      end
      it 'パスワードは半角英数字が混合されていれば、登録できる' do
        @user.password = 'abcdef123456'
        @user.password_confirmation = 'abcdef123456'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は、名前が全角（漢字・ひらがな・カタカナ）で入力すれば登録できる' do
        @user.first_name_j = '漢字ひらがなカタカナ'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は、名字が全角（漢字・ひらがな・カタカナ）で入力すれば登録できる' do
        @user.last_name_j = '漢字ひらがなカタカナ'
        expect(@user).to be_valid
      end
      it '全て揃っていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含まないと登録できない' do
        @user.email = 'testemail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、5文字以下では登録できない' do
        @user.password = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角数字のみの入力では登録できない' do
        @user.password = '12345678'
        @user.password_confirmation = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードは、半角英字のみの入力では登録できない' do
        @user.password = 'abcdefgh'
        @user.password_confirmation = 'abcdefgh'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードは、全角での入力では登録できない' do
        @user.password = 'テストパスワード'
        @user.password_confirmation = 'テストパスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'パスワードは、確認用を含めて2回、入力しない場合は登録できない' do
        @user.password = '1234aaa'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードとパスワード（確認用）が異なる場合は登録できない' do
        @user.password = '1234aaa'
        @user.password_confirmation = '1111bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名は、名前が空では登録できない' do
        @user.first_name_j = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name j can't be blank")
      end
      it 'ユーザー本名は、名字が空では登録できない' do
        @user.last_name_j = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name j can't be blank")
      end
      it 'ユーザー本名は、名前が全角（漢字・ひらがな・カタカナ）で入力しない場合は登録できない' do
        @user.first_name_j = 'namae'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name j 全角文字を使用してください')
      end
      it 'ユーザー本名は、名字が全角（漢字・ひらがな・カタカナ）で入力しない場合は登録できない' do
        @user.last_name_j = 'myouji'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name j 全角文字を使用してください')
      end
      it 'ユーザー本名のフリガナは、名前が空では登録できない' do
        @user.first_name_k = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name k can't be blank")
      end
      it 'ユーザー本名のフリガナは、名字が空では登録できない' do
        @user.last_name_k = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name k can't be blank")
      end
      it 'ユーザー本名のフリガナは、名前が全角（カタカナ）で入力しない場合は登録できない' do
        @user.first_name_k = '名前'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name k 全角（カタカナ）を使用してください')
      end
      it 'ユーザー本名のフリガナは、名字が全角（カタカナ）で入力しない場合は登録できない' do
        @user.last_name_k = '名字'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name k 全角（カタカナ）を使用してください')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
