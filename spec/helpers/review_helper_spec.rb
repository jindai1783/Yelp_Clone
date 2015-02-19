require 'rails_helper'

describe ReviewsHelper, :type => :helper do 
  context '#star_rating' do 
    it 'does nothing for not a number' do
      expect(helper.star_rating('N/A')).to eq 'N/A'
    end

    it 'returns five black stars for five' do
      expect(helper.star_rating(5)).to eq '★★★★★'
    end

    it 'returns three black stars for three' do
      expect(helper.star_rating(3)).to eq '★★★☆☆'
    end

    it 'returns 4 black and 1 white star' do 
      expect(helper.star_rating(3.5)).to eq '★★★★☆'
    end
  end
end