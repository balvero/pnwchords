class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :can_access, only: [:edit, :update]
  access all: [:show, :index], user: {except: [:destroy]}, site_admin: :all

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all.order('title ASC')
  end

  def my_songs
    @songs = Song.user_songs(current_user.id)
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @page_title = "#{@song.title} by #{@song.artist.name}"
  end

  # GET /songs/new
  def new
    @song = Song.new
    @user_id = current_user.id
  end

  # GET /songs/1/edit
  def edit
    @user_id = @song.user_id
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :key, :body, :artist_id, :user_id)
    end


    def can_access
      if current_user.id == @song.user_id or current_user.role == :site_admin
        return true
      else
        flash[:notice] = 'You can only edit or delete the Songs you added.'
        redirect_to songs_path
      end
    end

end
