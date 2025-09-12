function gcv2pro --wraps='gcloud compute ssh Victor@platform-v2 --project v2-pro --zone europe-west4-c' --description 'alias gcv2pro=gcloud compute ssh Victor@platform-v2 --project v2-pro --zone europe-west4-c'
  gcloud compute ssh Victor@platform-v2 --project v2-pro --zone europe-west4-c $argv
        
end
