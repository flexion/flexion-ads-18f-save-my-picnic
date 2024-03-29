Publicly accessible URL: http://pool2.18f.flexion.us/

Github repository: https://github.com/flexion/flexion-ads-18f-save-my-picnic

Evaluation branch: master

# Approach used to create the prototype #

This project represents work done as a part of Flexion Inc.'s (http://flexion.us) response to Pool Two of the GSA RFQ 4QTFHS150004 (Agile Delivery Services). Flexion Inc. is an enterprise IT advising, staffing and digital solutions company serving up lean and agile solutions.

We feel that Flexion practices are very much aligned with the U.S. Digital Services Playbook.  Where this narrative provides evidence for that, we have noted with a parenthesized number of the play.  For instance, if an item provides evidence of following play 2, it will be noted as (2).

Our choice of prototype was driven by personal experiences of friends, family and team members (1).  The last thing anyone wants when putting on a picnic is to use recalled food that would put family and friends at personal health risk.  Oftentimes when shopping for food you might remember vague details of a food recall, or wish to proactively check for recalled food. 

Given the abbreviated nature of the delivery, we rapidly assembled an experienced cross-functional team (7) with a clear leader.  Brice Ruth was assigned as the accountable leader (6) and quickly acted to set up an appropriate team workflow and technological framework that is described in more detail below.  We then began developing the solution via approximately two-day iterations. This is shorter than our typical delivery cycle, which varies by client, but the work breakdown and general project flow is still representative of a typical iteration. In the absence of other constraining factors we would normally advocate for two-week iterations (4).

For ease of reviewing our integrated development process we have utilized the GitHub issue tracker, creating tasks for code review, design deliverables, acceptance criteria, infrastructure decisions, infrastructure implementation and of course feature development and test tasks.  If you are interested in understanding our process, the information there should provide good insight.  However, since github tasks are not in the repository we have extracted a JSON view of them and stored them under revision control in the evidence/issues.json file for review and supporting evidence.

For development and design artifact workflow we used a develop branch and individual features merged via pull requests from feature-specific branches.  This was merged to master for evaluation purposes. Feature branches were merged after peer or project lead review and passing unit (Jasmine) tests (4). Continuous integration activity including automated testing was executed via a CircleCI cloud-based CI environment integrated into our GitHub repository (10).

Platform, architecture, technology and framework choices were made during an initial iteration 0 and informed by the constraints of the RFQ. We implemented a fundamentally responsive JavaScript solution with Bootstrap, AngularJS, CoffeeScript and Jade for the frontend and Node.js and Express for the backend (8). Data is accessed from https://open.fda.gov/food/enforcement/ in a RESTful manner.  At Flexion we are long-time advocates of commercially-hardened open source, and have used open technologies to create and host our prototype.  This prototype is released under a CC0 license as described in the LICENSE.md file and other components are licensed with MIT, MIT, Apache v2.0, BSD, GPL v2 and GPL v3 licenses (13).

Development-local test environments were automated using Grunt with a revision-controlled Dockerfile available for containerized testing when necessary or for running a standalone environment.

A publicly-accessible instance of the prototype is accessible using the url at the top of this document.  It is running in a Docker container on Amazon EC2 infrastructure (9), provisioned via the automated process documented in RUNNING.md file in the root of the repository (11).  The publicly-available prototype is monitored continuously using Amazon CloudWatch.

Additional instructions are included in RUNNING.md for running this prototype on another machine, including either a lightweight “grunt serve” approach or a local containerized Docker approach (9).

The creation of this prototype was done in the typical Flexion manner: we take pride in our productivity and had a lot of fun delivering useful functionality in an agile, high-velocity manner as a high-functioning team using modern and open tools.  We appreciate the non-traditional approach manifested in this RFQ and are philosophically very aligned with its tenets.  We hope to be able to bring our agile skills to bear for the Federal government and 18F.
