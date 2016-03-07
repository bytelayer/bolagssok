require "nokogiri"
require "open-uri"
require "uri"

class SearchController < ApplicationController
  def db_save(company_name, company_number)
    @company = Company.new(:name => company_name, :number => company_number)
    @company.save
  end

  def lookup_cached(company_name)
    @company = Company.find_by name: company_name
    if @company
      return @company.number
    else
      return nil
    end
  end

  def lookup_new(company_name)
    url = "http://www.allabolag.se/?what=" + URI.encode(company_name)
    regex_company_name = company_name.gsub(/(?: |%20)/, ".")

    doc = Nokogiri::HTML(open(url))
    doc.css("a").each do |link|
      if link["href"] =~ /(\d{10})\/(#{regex_company_name}.*$)/i
        company_number = $1
        company_name = $2.gsub("_", " ")
        db_save(company_name, company_number)
        return company_number
      end
    end

    return nil
  end

  def lookup_company_number(company_name)
    number = lookup_cached(company_name)
    if number.nil?
      number = lookup_new(company_name)
    end

    return number
  end

  def find
    format = params[:format]
    company_name = params[:q]
    company_number = lookup_company_number(company_name)
    
    case format
    when "json"
      render json: @company
    when "xml"
      render xml: @company
    else
      render company_number.to_s
    end
  end
end


