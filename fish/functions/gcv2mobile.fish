function gcv2mobile --wraps='gcloud compute ssh Victor@mobile-v2 --project v2-pro --zone europe-west4-c' --description 'alias gcv2mobile=gcloud compute ssh Victor@mobile-v2 --project v2-pro --zone europe-west4-c'
  gcloud compute ssh Victor@mobile-v2 --project v2-pro --zone europe-west4-c $argv
        
end
