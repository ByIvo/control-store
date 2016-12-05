class ReportController < ApplicationController
	before_action :setup_filters, only: [:products]

	def products
		@filtered_products = Product.all

		unless @filters[:filter].empty?
			@filtered_products = @filtered_products.where("name like ?", '%'+@filters[:filter]+'%')
		end

		unless @filters[:min_price] == '0'
			@filtered_products = @filtered_products.where("price >= ?", @filters[:min_price])
		end

		unless @filters[:max_price] == '0'
			@filtered_products = @filtered_products.where("price <= ?", @filters[:max_price])
		end

	end


	private

	def setup_filters
		if @filters == nil then
			@filters = {}
		end

		@filters[:filter] = params[:filter].presence || ''
		@filters[:min_price] = params[:min_price].presence || 0
		@filters[:max_price] = params[:max_price].presence || 0

		clear_params
	end

	def clear_params
		if params.key?(:clear) then
			@filters[:filter] =  ''
			@filters[:min_price] = '0'
			@filters[:max_price] = '0'
		end
	end
end
