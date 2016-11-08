json.extract! bulletin_board, :id, :num_posts, :created_at, :updated_at
json.url bulletin_board_url(bulletin_board, format: :json)