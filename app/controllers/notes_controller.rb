class NotesController < ApplicationController

    def index
      if valid_token_exists
        notes=Note.all
        render json: notes
      else render json: {errors: "go away"}, status: :unauthorized
    end
      end
    
        def show
          note=Note.find(params[:id])

          if logged_in_user_id===note.park_collection.user_id
            render json: note  
          else render json: {errors: "go away"}, status: :unauthorized
          end 
        end
    
        def create
          # maybe work on authorization for this more
          if valid_token_exists
            note = Note.create(note_params)
            render json: note
          else render json: {errors: "go away"}, status: :unauthorized
        end
        end
    
        def update
          note=Note.find(params[:id])
          if logged_in_user_id===note.park_collection.user_id
          note.update(entry: params[:entry])
          render json: note
          else render json: {errors: "go away"}, status: :unauthorized
        end
        end
    
        def destroy
          note=Note.find(params[:id])
          notes=Note.all
          park_collection_id= note.park_collection_id
          user_id= note.park_collection.user_id

          if logged_in_user_id===user_id
          note.destroy
          notes_in_park_collection= notes.where(park_collection: park_collection_id)
          render json: notes_in_park_collection
          else render json: {errors: "go away"}, status: :unauthorized
        end
        end
    
        def note_params
            params.permit(:entry, :park_collection_id)
        end

end
