class LoginController < ApplicationController

	def login
		$logged_user = nil;
	end

	def authenticate
		login = params[:login]
		password = params[:password]

		$logged_user = Seller.where("email like ? AND password like ?", login, password).first;

		if $logged_user == nil
			$logged_user = Administrator.where("email like ? AND password like ?", login, password).first;
		end

		unless $logged_user == nil
			redirect_to "/authenticated"
		else
			redirect_to "/login", notify: "Usuário ou senha não encontrados"
		end
		
	end

	def authenticated
		if $logged_user == nil
			redirect_to "/login"
		end
	end

	def logout
		$logged_user = nil
		redirect_to "/login"
	end
end
