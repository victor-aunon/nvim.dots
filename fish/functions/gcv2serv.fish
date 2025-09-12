function gcv2serv --wraps='gcloud compute ssh Victor@services-v2 --project v2-pro --zone europe-west4-c' --description 'alias gcv2serv=gcloud compute ssh Victor@services-v2 --project v2-pro --zone europe-west4-c'
  gcloud compute ssh Victor@services-v2 --project v2-pro --zone europe-west4-c $argv
        
end
