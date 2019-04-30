class ListsController < ApplicationController
  before_action :authenticate_user!
  def index
  	@lists = current_user.lists
  	@body = "なし"
  	@test = 0

  	require 'net/imap'
	require 'kconv'
	require 'mail'

	# imapに接続
	imap_host = 'imap.gmail.com' # imapをgmailのhostに設定する
	imap_usessl = true # imapのsslを有効にする
	imap_port = 993 # ssl有効なら993、そうでなければ143
	imap = Net::IMAP.new(imap_host, imap_port, imap_usessl)
	# imapにログイン
	imap_user = 'minotaka.0730@gmail.com'
	imap_passwd = '0730Minori'
	imap.login(imap_user, imap_passwd)

	imap.select('INBOX') # 対象のメールボックスを選択
	ids = imap.search(['ALL']) # 全てのメールを取得

	imap.fetch(ids, "RFC822").each do |mail|
	  m = Mail.new(mail.attr["RFC822"])
	  # multipartなメールかチェック
	  if m.multipart?
	    # plantextなメールかチェック
	    if m.text_part
	      @body = m.text_part.decoded
	    # htmlなメールかチェック
	    elsif m.html_part
	      body = m.html_part.decoded
	    end
	  else
	    body = m.body
	  end
	end

	if @body == "テスト"
		@test = 1
		list = List.new
		list = current_user.lists.new
		list.name = "1"
		list.switch = 0
		list.c_at = Date.today.to_time
		list.save!
	end

  end

  def show
  	@list = target_list params[:id]
  end

  def carender
  	@days = []
  	@t = Time.now
  end

  def month
  	@days = []
  	@t = DateTime.parse(params[:date])
  end

  def destroy
    @list = target_list params[:id]
    @list.destroy
    redirect_to lists_url
  end

  private
    def target_list list_id
      current_user.lists.where(id: list_id).take
    end

    def list_params
      params.require(:list).permit(:name, :switch, :c_at)
    end

end
