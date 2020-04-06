class NotesController < ApplicationController

    def index
        notes=Note.all
        render json: notes
      end
    
        def show
          # figure out how to limit access to this- right now I can pull up another user's notes 
          note=Note.find(params[:id])

          if logged_in_user_id===(params[:user_id])
            render json: note  
          else render json: {errors: user.errors.full_messages}, status: :unauthorized
          end 
        end
    
        def create
          if valid_token_exists
            note = Note.create(note_params)
            render json: note
          else render json: {errors: user.errors.full_messages}, status: :unauthorized
        end
        end
    
        def update
          if valid_token_exists
          note=Note.find(params[:id])
          note.update(entry: params[:entry])
          render json: note
          else render json: {errors: user.errors.full_messages}, status: :unauthorized
        end
        end
    
        def destroy
          if valid_token_exists
          note=Note.find(params[:id])
          note.destroy
          render json: {message: "Your note has been deleted."}
          else render json: {errors: user.errors.full_messages}, status: :unauthorized
        end
        end
    
        def note_params
            params.permit(:entry, :park_collection_id)
        end

end
