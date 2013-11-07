require_relative 'spec_helper'
require 'link'

describe Link do 

  it 'should start as an empty database' do 
    expect(Link.count).to eq 0
  end

  it 'should be able to store a link in the database' do 
    Link.create(title: "Makers Academy", uri: "http://www.makersacademy.com/")
    expect(Link.count).to eq 1
  end

  it 'has a uri' do 
    link = Link.create(title: "Makers Academy", uri: "http://www.makersacademy.com/")
    expect(link.uri).to eq "http://www.makersacademy.com/"
  end

  it 'has a title' do 
    link = Link.create(title: "Makers Academy", uri: "http://www.makersacademy.com/")
    expect(link.title).to eq "Makers Academy"
  end

  it 'can destroy a link' do 
    Link.create(title: "Makers Academy", uri: "http://www.makersacademy.com/")
    Link.all.destroy
    expect(Link.count).to eq 0
  end

end