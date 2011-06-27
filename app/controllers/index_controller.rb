class IndexController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'rubygems'
  require 'json'
  require 'time'
  
  #before_filter :apiupdate
  def index
  end
  #def looper
	#  i = 0
	  ##  i = i + 1
		#  :apiupdate
		  #sleep 30
		#end
	  #end
  def apiupdate
	url = URI.parse('http://www.btcguild.com')
	res = Net::HTTP.start(url.host, url.port) {|http|
		http.get('/api.php?api_key=66b2217e699a0f8e0e383f7cc937b4f4')
	}
	data = res.body

	raw = StringScanner.new(data)
	
	raw.skip_until /"confirmed_rewards":/
	@confirmed = raw.scan_until (/,/)
	@confirmed = @confirmed.to_f
	
	raw.skip_until /"unconfirmed_rewards":/
	@unconfirmed = raw.scan_until (/,/)
	@unconfirmed = @unconfirmed.to_f
	
	raw.skip_until /"estimated_rewards":/
	@estimated = raw.scan_until (/,/)
	@estimated = @estimated.to_f
	
	raw.skip_until /"payouts":/
	@payouts = raw.scan_until (/,/)
	@payouts = @payouts.to_f

	raw.skip_until /"workers":{"/
	@workernum = raw.scan_until (/"/)
	@workernum = @workernum.to_i
	
	raw.skip_until /"worker_name":"/
	@workername = raw.scan_until (/"/)
	@workername = @workername[0,13]
	
	raw.skip_until /"hash_rate":/
	@hash = raw.scan_until (/,/)
	@hash = @hash.to_f
	
	raw.skip_until /"round_shares":/
	@roundsh = raw.scan_until (/,/)
	@roundsh = @roundsh.to_i
	
	raw.skip_until /"round_stales":/
	@roundst = raw.scan_until (/,/)
	@roundst = @roundst.to_i
	
	raw.skip_until /"reset_shares":/
	@resetsh = raw.scan_until (/,/)
	@resetsh = @resetsh.to_i
	
	raw.skip_until /"reset_stales":/
	@resetst = raw.scan_until (/,/)
	@resetst = @resetst.to_i
	
	raw.skip_until /"total_shares":/
	@totalsh = raw.scan_until (/,/)
	@totalsh = @totalsh.to_i
	
	raw.skip_until /"last_share":/
	@lastsh = raw.scan_until (/,/)
	@lastshtime = @lastsh[1,7]

	position = raw.pos()
	
	#enter code for more than 1 worker HERE
=begin
	i = 1
	while raw.eos? == false
		i = i + 1
		raw.skip_until /"hash_rate":/
		start = raw.pos()
		rate = raw.scan_until (/,/)
		rate = rate.to_f
		if rate > 0
			start = start - 48
			raw.pos(start)
				raw.skip_until /i/
				@workernum = raw.scan_until (/"/)
				@workernum = @workernum.to_i
				
				raw.skip_until /"worker_name":"/
				@workername = raw.scan_until (/"/)
				@workername = @workername[0,13]
				
				raw.skip_until /"hash_rate":/
				@hash = raw.scan_until (/,/)
				@hash = @hash.to_f
				
				raw.skip_until /"round_shares":/
				@roundsh = raw.scan_until (/,/)
				@roundsh = @roundsh.to_i
				
				raw.skip_until /"round_stales":/
				@roundst = raw.scan_until (/,/)
				@roundst = @roundst.to_i
				
				raw.skip_until /"reset_shares":/
				@resetsh = raw.scan_until (/,/)
				@resetsh = @resetsh.to_i
				
				raw.skip_until /"reset_stales":/
				@resetst = raw.scan_until (/,/)
				@resetst = @resetst.to_i
				
				raw.skip_until /"total_shares":/
				@totalsh = raw.scan_until (/,/)
				@totalsh = @totalsh.to_i
				
				raw.skip_until /"last_share":/
				@lastsh = raw.scan_until (/,/)
				@lastshtime = @lastsh[1,7]
			
		end
	end
=end
	
	raw.skip_until /"pool"/
	raw.skip_until /"hash_rate":/
	@poolhash = raw.scan_until (/,/)
	@poolhash = @poolhash.to_f
	
	raw.skip_until /"round_time":"/
	@round = raw.scan_until (/"/)
	@roundtime = @round[0,7]
	
	@total_reward = (@confirmed + @unconfirmed + @estimated)
	
	#create new db object...maybe
	b = Parsed.new
	b.confirmed_rewards = @confirmed
	b.estimated_rewards = @estimated
	b.payouts = @payouts
	b.unconfirmed_rewards = @unconfirmed
	b.worker_num = @workernum
	b.worker_name = @workername
	b.hash_rate = @hash
	b.round_shares = @roundsh
	b.round_stales = @roundst
	b.reset_shares = @resetsh
	b.reset_stales = @resetst
	b.total_shares = @totalsh
	b.last_share = @lastshtime
	b.pool_hash_rate = @poolhash
	b.round_time = @roundtime
	b.save
		
	render :action => 'parser'
end

end
