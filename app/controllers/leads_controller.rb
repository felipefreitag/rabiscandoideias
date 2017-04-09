class LeadsController < ApplicationController
  def create
    @lead = Lead.where(lead_params).first_or_initialize
    if @lead.save
      redirect_to page_path('thank_you')
    else
      flash[:failure] = @lead.errors.full_messages.first
      redirect_to :root
    end
  end

  private
    def lead_params
      params.require(:lead).permit(:email)
    end
end
