# one2onetool
Create   a   CI/CD   pipeline   (bash   script   or   any   CI/CD   tool   that   you   are    most comfortable with)   that   monitors   the   “release”   and   “staging”   branches   of   the   repository.   The   pipeline should be triggered on new commits and perform at least   the   following: 
1. The   pipeline   should   build   and   run   tests   on   the   application
    Solution: Build and test were successful via Docker file
2. Containerize   and   deploy   the   application   on   a   public   cloud   instance
    Solution: As there is no access to cloud instance, had containerized using docker and Jenkins as part of CI/CD pipeline
3. There   are   two   branches,   “staging”   and   “release”: 
a. “staging”   branch   should   use   “Questions-test.json”   as   its   input   data   file 
b. “release”   branch   should   use   “Questions.json”   as   its   input   data   file 
   Suggestion: As it requires little bit of frontend development knowledge in order to route via environmental variable in index.js, so this requirement is left out in pending state, so at this moment its points to defaults (i.e., Questions.json)
4. Consider   how   versioning  can be  done   to   differentiate   the   builds 
Suggestion: We can differentiate builds by having version number appended with branch name (i.e., staging/release) for which we can make use of standard-version npm package, which can perform next development version will be automatically applied into package.json and committed to respective branch
5. If   any   of   the   tasks   fails   at   any   point,   the   pipeline   should   be   stopped   and   an   email   alert should   be   sent   with   relevant   information
Solution: As part of Jenkinsfile, we can have post only with failure, which will trigger mail only when it fails with relevant log links
