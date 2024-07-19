class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[show edit update destroy]

  # GET /budgets or /budgets.json
  def index
    if params[:archive_month]
      # Fetch budgets for the selected archive month
      @budget_categories = Budget.includes(:category)
                                 .where(archive_month: Date.parse(params[:archive_month]), current_month: false)
                                 .map do |budget|
        {
          category: budget.category.name,
          budget_amount: budget.budget_amount.to_f,
          fact_amount: budget.fact_amount.to_f,
          budget_id: budget.id,
          archive_month: true
        }
      end
    else
      # Fetch the current month's budget
      @budget_categories = Budget.includes(:category)
                                 .where(current_month: true)
                                 .map do |budget|
        {
          category: budget.category.try(:name),
          category: budget.category.name,
          budget_amount: budget.budget_amount.to_f,
          fact_amount: budget.fact_amount.to_f,
          budget_id: budget.id,
          archive_month: false
        }
      end
    end

    @archive_months = Budget.distinct.pluck(:archive_month).compact.sort.reverse.reject { |month| month == Date.today.beginning_of_month }
    @budget = Budget.new
    @category = Category.new
  end

  # GET /budgets/1 or /budgets/1.json
  def show
  end

  # GET /budgets/new
  def new
    @budget = Budget.new
    @category = Category.new
  end

  # GET /budgets/1/edit
  def edit
    @category = Category.find(@budget.category_id)
    p @category
  end

  # POST /budgets or /budgets.json
  def create
    new_category_name = budget_params[:category_name] == "" ? nil : budget_params[:category_name]
    @category = Category.find_or_initialize_by(name: new_category_name, include_in_budget: true)
    @budget = @category.budgets.find_or_initialize_by(category: @category, current_month: true)
    @budget.assign_attributes(budget_params.except(:category_name).merge(category_id: @category.id, budget_amount_cents: budget_params[:budget_amount].to_i * 100,
    fact_amount_cents: 0, current_month: true))
    
    respond_to do |format|
      if @category.save && @budget.save
        format.html { redirect_to budgets_url, notice: "Category added." }
        format.json { render :show, status: :created, location: @budget }

      else
        format.html { render :new }
        format.turbo_stream { render turbo_stream: turbo_stream.replace('modal', template: 'budgets/new', locals: { budget: @budget, category: @category }) }
      end
    end
  end

  # PATCH/PUT /budgets/1 or /budgets/1.json
  def update
    respond_to do |format|
      @category = Category.find(@budget.category_id)
      @category.update(name: budget_params[:category_name])
      if @budget.update(budget_amount_cents: budget_params[:budget_amount].to_i * 100)
        format.html { redirect_to budgets_url, notice: "Budget category was successfully updated." }
        format.json { render :show, status: :ok, location: @budget }

      else
        format.html { render :edit }
        format.turbo_stream { render turbo_stream: turbo_stream.replace('modal', template: 'budgets/edit', locals: { budget: @budget, category: @category }) }
      end
    end
  end

  # DELETE /budgets/1 or /budgets/1.json
  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url, notice: "Budget was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_budget
    @budget = Budget.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit([:category_name, :budget_amount])
  end
end
