function gcv2dev --wraps='gcloud compute ssh Victor@develop-v2-full --project v2-dev-int --zone europe-west4-c' --description 'alias gcv2dev=gcloud compute ssh Victor@develop-v2-full --project v2-dev-int --zone europe-west4-c'
  gcloud compute ssh Victor@develop-v2-full --project v2-dev-int --zone europe-west4-c $argv
        
end
