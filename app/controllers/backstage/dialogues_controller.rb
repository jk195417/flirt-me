class Backstage::DialoguesController < Backstage::BaseController
  before_action :find_dialogue, only: %w[show edit update destroy]
  def index
    @dialogues = Dialogue.order(:id).all
  end

  def show; end

  def new
    @dialogue = Dialogue.new
  end

  def create
    @dialogue = Dialogue.new(dialogue_params)
    if @dialogue.save
      flash[:notice] = "成功建立撩妹金句: #{@dialogue.title}"
      redirect_to action: :index
    else
      flash[:danger] = '建立撩妹金句過程中發生了ㄧ些錯誤'
      render :new
    end
  end

  def edit; end

  def update
    if @dialogue.update(dialogue_params)
      flash[:notice] = "成功編輯撩妹金句: #{@dialogue.title}"
      redirect_to action: :index
    else
      flash[:danger] = '編輯撩妹金句過程中發生了ㄧ些錯誤'
      render :edit
    end
  end

  def destroy
    if @dialogue.destroy
      flash[:warning] = "成功刪除撩妹金句: #{@dialogue.title}"
      redirect_to action: :index
    end
  end

  private

  def find_dialogue
    @dialogue = Dialogue.find(params[:id])
  end

  def dialogue_params
    params.require(:dialogue).permit(:title, :source, :likes, :dislikes, :user_id)
  end
end