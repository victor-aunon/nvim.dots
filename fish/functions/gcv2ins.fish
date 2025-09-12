function gcv2ins --wraps='gcloud compute ssh Victor@instance-20250831-084925 --project v2-dev-int --zone europe-west4-c' --description 'alias gcv2ins=gcloud compute ssh Victor@instance-20250831-084925 --project v2-dev-int --zone europe-west4-c'
  gcloud compute ssh Victor@instance-20250831-084925 --project v2-dev-int --zone europe-west4-c $argv
        
end
