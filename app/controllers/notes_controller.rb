class NotesController < ApplicationController

    def index
        notes=Note.all
        render json: notes
      end
    
        def show
            parkCollection=ParkCollection.find_by(params[:id])
            render json: parkCollection.notes   
        end
    
        def create
            note = Note.create(note_params)
            render json: note
        end
    
        def update
          note=Note.find(params[:id])
          note.update(entry: params[:entry])
          render json: note
        end
    
        def destroy
          note=Note.find(params[:id])
          note.destroy
          render json: {message: "Your note has been deleted."}
        end
    
        def note_params
            params.permit(:entry, :park_collection_id)
        end

end
