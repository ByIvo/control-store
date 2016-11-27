class ReportController < ApplicationController
	# before_action :setup_filters, only: [:products]

	@filtered_products
	def products
		@filtered_products = Product.all

		# unless @filter[:filter].empty?
		# 	@filtered_products = @filtered_products.where("name like '\%%{@filter[:filter]}\%'")
		# end

		# if @filter[:filter] > 0
		# 	@filtered_products.contains(@filter[:filter])
		# end
	end


	# private

	# def setup_filters
	# 	if @filters == nil then
	# 		@filters = {}
	# 	else
	# 		@filter[:filter] = params[:filter].presence || nil
	# 		@filter[:min_price] = params[:min_price].presence || 0
	# 		@filter[:max_price] = params[:max_price].presence || 0

	# 	end
	# end
end
