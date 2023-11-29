# Baskerville Training @RFI @DLS

## Monday 27th & Tuesday 28th November, 2023 | Hybrid

### Day 1 | 11:00-16:00 | Harwell Innovation Centre

### Day 2 | 9:00-16:00 | Advance Training Centre/Mary Lyon Centre

![Baskerville logo](../img/logo.png)

The Baskerville team are holding a 2-day in-person training session for users at the Rosalind Franklin Institute and Diamond Light Source! This is your opportunity to get to know the Baskerville RSEs and get hands-on with the system.

## :calendar: Schedule

### Day 1 - [Harwell Innovation Centre](https://maps.app.goo.gl/DT7TkyExUyxTQ2Yp7)

| Time | Name | Description | Duration | Instructor | Helper |
| --- | --- | --- | --- | --- | --- |
| 11:00 - 12:00 | Intro to Baskerville HPC | Introduction to the cluster, logging in | 1h | Jenny | Simon |
| 12:00 - 13:00 | Lunch | – | 1h | – | – |
| 13:00 - 14:00 | RELION (part 1) | Presentation and Practical demo | 1h | Dimitrios | Gavin |
| 14:00 - 14:15 | Break | – | 15m | – | – |
| 14:15 - 15:15 | RELION (part 2) | Practical demo | 1h | Gavin | Dimitrios |
| 15:15 - 15:30 | Break | – | 15m | – | – |
| 15:30 - 16:00 | Data Transfers with Globus | Logging in, GUI, Globus Connect Personal | 30m | James | Jenny |

### Day 2 - [Advance Training Centre/Mary Lyon Centre](https://maps.app.goo.gl/g7w2VUAJNnfdtT4K7)

| Time | Name | Description | Duration | Instructor | Helper |
| --- | --- | --- | --- | --- | --- |
| 9:00 - 9:30| Morning Coffee | – | 30m | – | – |
| 9:30 - 10:30  | Interactive Jobs (`srun`) | Using SLURM and the basics of scheduling, resource requests, module loading | 1h | Gavin | Simon |
| 10:30 - 10:45 | Break | – | 15m | – | – |
| 10:45 - 12:00 | Non-Interactive Batch Jobs (`sbatch`) | Using SLURM and the basics of scheduling, resource requests, module loading | 1h15m | James | Jenny |
| 12:00 - 13:00 | Lunch | – | 1h | – | – |
| 13:00 - 13:30 | Intro to Profiling | Presentation | 30m | Jenny | Gavin |
| 13:30 - 14:30 | Self-installed software with `pip` and using containers | Self-installed Python environments and using `apptainer` | 1h | Simon | James |
| 14:30 - 14:45 | Break | – | 15m | – | – |
| 14:45 - 15:45 | Intro to Baskerville Portal | Introduction to GUI, `conda` environments | 1h | Jenny | Gavin |
| 15:45 - 16:00 | Wrap-up and close | Signposts to further resources, getting support from the Baskerville RSE service, and feedback | 15m | James | Simon |

## :spiral_note_pad: Use this document

Useful comments in the Zoom chat disappear after the event, so we will use this HackMD document as a collaborative note taking tool.

This document will be placed in our public [GitHub](https://github.com/baskerville-hpc) repo (with identifying information removed) for your future reference.

## :link: Useful Resources

- [Baskerville Code of Conduct](https://github.com/baskerville-hpc/code-of-conduct)
- [Baskerville Docs](https://docs.baskerville.ac.uk/)
- [Baskerville GitHub](https://github.com/baskerville-hpc)
- [Baskerville Admin](https://admin.baskerville.ac.uk/)
- [Baskerville Apps](https://apps.baskerville.ac.uk/)
- [Baskerville Portal](https://portal.baskerville.ac.uk/)

## :one: 11:00 - 12:00 | Intro to Baskerville HPC

Hello, welcome to this session; please ask your questions here!

- Alternatives to phone authentication; Simon H suggested Authy, there's a desktop version.(mobile · macOS · Windows 32bit · Windows 64bit · Linux)
- <https://authy.com/>
- <https://authy.com/blog/authy-vs-google-authenticator/>
- You can use [admin.baskerville.ac.uk](https://admin.baskerville.ac.uk/) to find your username, in which you can login using your email.

- *? Can we use symbolic links to quickly change directory?*
  - JA - Yes, I would recommend it.
  - *Sorry, I was asking how we do this. cd \<project name> doesn't seem to work*
  - Try `cd /bask/projects/j/jgms5830-rfi-train`
  - To create a symbolic link `ln -s /bask/projects/j/jgms5830-rfi-train ~/jgms5830-rfi-train`
  - Both of these command should work from any directory
  - If you get permission denied, talk to Dimitrios to add you to the project.
  - *I can create the link but i don't know the command to change to the project directory through the link*
  - Treat it the same as any other directory; once you've created the link with ln, then use cd.

```bash
*[sgmf2894@bask-pg-login02 ~]$ ls
training
[sgmf2894@bask-pg-login02 ~]$ cd training
-bash: cd: training: No such file or directory*
```

- Can you show `ls -l train*`

```bash
*[sgmf2894@bask-pg-login02 ~]$ ls -l train*
*lrwxrwxrwx. 1 sgmf2894 users 36 Nov 27 11:39 training -> /bask/projects/j/jgms55830-rfi-train*
 *oh i typod it lol*
```

- No worries, that's normally me!
- Size of subdirectories in linux. May take a looooong time.
  - `du -hc --max-depth=1`
  - @wongj If you have to run this on a folder with lots of data, then I would recommend you run this command in a compute job! (If you run this on a login node, you could impact other users on that login node.)
  - Can remove the max-depth for all files.

## :two: 13:00 - 15:15 | RELION

Hello, welcome to this session; please ask your questions here!

- @wongj We're back!
- In Baskerville Portal, the number of hours you request in the form refers to the number of hours for the GUI, and not the compute job itself.
- time format in RELION days-hours:minutes:seconds
- Projects `jgms5830-rfi-train` and `offx6098-dls-train`
- reservation equals project name `--reservation=`
  - @wongj bear in mind that this reservation only lasts during the training event so that people don't have to queue during the practicals - this reservation will disappear after tomorrow and you will have to queue like the rest of us!
- Number of MPI procs and number of threads: optimal values depend on the nature of your RELION job - don't be afraid to experiment and test
- Tutorial <https://relion.readthedocs.io/en/release-4.0/SPA_tutorial/Introduction.html>
- Once you have launched your job through the RELION GUI, remember to close the app, which will free resources for others to use (or indeed for yourself to use!)
- List of RELION job terms can be found: <https://slurm.schedmd.com/sbatch.html>
- Example definition:

```bash
#!/bin/bash
#SBATCH -J Relion # Job-name
#SBATCH -n 1 # ntasks
#SBATCH -c 30 # cpus-per-task
#SBATCH -e MotionCorr/job011/run.err # error file
#SBATCH -o MotionCorr/job011/run.out # output file
#SBATCH -q rfi # qos
#SBATCH -t 0-00:30:00 #time days-hours:minutes:seconds
#SBATCH -A jgms5830-rfi-train # account
#SBATCH --gpus-per-task=1
#SBATCH --export=NONE
#SBATCH --get-user-env
```

- RELION v5 coming out soon (currently in beta)
- Please place the data from the RELION tutorial in your project folders
  - I would suggest creating a subdirectory in the project folder for your working space, e.g. `mkdir /bask/projects/j/jgms5830-rfi-train/<your_username>`

## :three: 15:30 - 16:00 | Data Transfers with Globus

Hello, welcome to this session; please ask your questions here!

- [Globus website](https://www.globus.org/)
- Log in with your institutional credentials
- UUID is how you refer to an individual endpoint when using the SDK to write your own Globus programs
- Creating bookmarks is quite nice for referring to collections quickly
- `Transfer & Timer options` can be useful, e.g. schedule start, label transfers, skip files on error, ...
- An email is sent to you when the transfer is complete
- Authentication lasts for 30 days (for security reasons)
- Globus Connect Personal is an app you can download to transfer files from your local machine to endpoints (and vice versa).
-

## :four: 9:30 - 10:30 | Interactive Jobs (`srun`)

Hello, welcome to this session; please ask your questions here!

- Source for training material: <https://github.com/baskerville-hpc/2023-07-26-remote-drop-in/blob/main/presentations/02b-interactive-jobs/InteractiveJobs.pdf>
- `tmux` is great for reconnecting to your terminal session when your connection to Baskerville drops without losing your work/interactive job)!
- for the project name and reservation names
  - `jgms5830-rfi-train` (`qos=rfi`)
  - `offx6098-dls-train` (`qos=diamond`)
  - reservations (instant jobs) will end by the close of the workshop, and you will have to queue like everyone else on Baskerville thereafter!

- `wget https://github.com/NVIDIA/cuda-samples/archive/refs/tags/v11.6.tar.gz`

- ~~What is wrong here? v~~

```bash
srun --export=USER,HOME,PATH,TERM --account=jgms5830-rfi-train --qos=rfi, --nodes=1-1 --ntasks=36 --gres=gpu:1 --time=6:0:0 --pty /bin/bash >> interactive
srun: error: Please specify a qos, e.g. '--qos=bham'                                                              │
srun: error: Unable to allocate resources: Requested operation not supported on this system                       │
srun: error: Please specify a qos, e.g. '--qos=bham'                                                              │
srun: error: Unable to allocate resources: Requested operation not supported on this system                       │
srun: error: Please specify a qos, e.g. '--qos=bham'                                                              │
srun: error: Unable to allocate resources: Requested operation not supported on this system                       │
srun: error: Unable to allocate resources: Invalid account or account/partition combination specified             │
srun: error: Unable to allocate resources: Invalid qos specification  
```

- There's a comma after `qos=rfi` when there shouldn't be :smile:
  - *whoops*

- Not really understanding how i'm creating a second session in the panel, or how to assign them different GPUs. Trying to follow the pdf but it's vague in parts

![Untitled](https://hackmd.io/_uploads/HypogB7Sa.png)

Specifically i didn't get how to get into the CUDA module once my interactive session has started. It just seems to sit in 'waiting for resources'

- It looks like all of the available GPUs from the reservation have been snapped up from your colleagues, which is why it's waiting for resources unfortunately.

:::warning
Make sure you use the command `exit` (not detach) any sessions when you are done with your work, so that the GPUs you are using are released back into the pool for others to use on Baskerville!
:::

- What is the command to exit sessions?
  - `exit` :)

## :five: 10:45 - 12:00 | Non-Interactive Batch Jobs (`sbatch`)

Hello, welcome to this session; please ask your questions here!

- Find example Slurm scripts [here](https://github.com/baskerville-hpc/basicSlurmScripts)

- *How do we get from the login node (i.e we've just logged into the terminal) to wherever we put the script in?*
  - I would put your job script in your project folder, e.g. `cd /bask/projects/j/jgms5830-rfi-train`

- [name=Dimitrios Bellos] I believe you can see an estimate of the time your job will run by executing:
`squeue --format="%.8i %.20P %.30j %p %.20S %.8T %.8M %.8l %.6D %R"`
However, it is not very accurate since it uses the requested time of the other submitted jobs to create the estimate. Of course it is frequent the case where users request for 1 hour but the job takes only 40 minutes.

- How do I put a script in a folder? Globus?
  - You can use Globus yes. For transferring files from your laptop/local machine to Baskerville, you can also use`rsync -zavh <source path> <username>@login.baskerville.ac.uk:<destination path>`
  - [name=Dimitrios Bellos] as we also mentioned yesterday you can create a Globus timer (aka recurrent transfer) to keep your local and Baskerville directories synced. However, because Baskerville authentication in Globus last only 30 days you will have to reset the timer every 30 times as it will hang.
  - <https://docs.baskerville.ac.uk/baskerville-basics/jobs/#transferring-data>
    - rsync
    - scp

- May I suggest `squeue --me` if you just want to check YOUR job only. Easier to type than `squeue -u $USER`. (Oh actually I think Baskerville default to seeing only your job anyway?? [name=Tim Poon])
  - :heavy_check_mark:
  - Yes on Baskerville you only see your own jobs running for security reasons (we have commercial partners using the system too with sensitive information). This is not true for all HPC facilities though, just specific to Baskerville.

- [name=Tim Poon] Does 'watch squeue' or similar ok in Baskerville or just for demo purpose here? I remember someone saying this will poll the database and result in slow down.
  - `nice watch squeue -u myUserName`
That runs your process at a reduced priority (compared to the default priority level). Assuming that the cluster jobs are running at normal priority, nice-ing your process tells the scheduler that you are willing to accept only whatever spare CPU time is left over after all the jobs above you have gotten their CPU time.
  - Thank you!

- The presentation is missing from the github folder
  - You can wait for the presentation to be uploaded [here](https://github.com/baskerville-hpc/2023-11-27-RFI-DLS-training/tree/main/docs/04b-non-interactive-jobs) (currently just source files for the presentation in there at the moment

- getting an error from job submission. The files appear to have been converted to DOS format and the linebreak is being rejected. Any idea how to switch the file type? **error:** │sbatch: error: Batch script contains DOS line breaks (\r\n)
  - You can try the command `dos2unix <YOUR_FILE>` to convert line break to UNIX style, it may help.
  - That worked to convert the file but now there is an account issue.. might try logging out and in. **error:** sbatch: error: Batch job submission failed: Invalid account or account/partition combination specified
  - You will need to provide an account by `--account=<YOUR_PROJECT>`.
  - Is there a specific account were using for this training?
  - `jgms5830-rfi-train (qos=rfi)` or `offx6098-dls-train (qos=diamond)` depends on you are from RFI or DLS.
  - Without the `(qos=XXX)` sorry, it is to indicate what qos you should use.
  - Tried that too, that had a invalid qos error

```bash
sbatch --account=`jgms5830-rfi-train (qos=rfi)` 1-basicSlurm.sh                       -bash: command substitution: line 1: syntax error near unexpected token `qos=rfi'
-bash: command substitution: line 1: `jgms5830-rfi-train (qos=rfi)'
sbatch: error: Batch job submission failed: Invalid account or account/partition combination specified
```

- hi sorry, you need to separate the `qos` into its own argument (`--qos=rfi`) and readjust your `--account` parameter accordingly
- That worked, thank you

```bash
[sgmf2894@bask-pg-login03 ~]$ sbatch 1-basicSlurm.sh
sbatch: error: Batch job submission failed: Invalid account or account/partition combination specified
```

- [name=Dimitrios Bellos] Here in this link you can read more about to create dependancies between jobs (e.g. start this job if the other one has finish)
<https://slurm.schedmd.com/sbatch.html#OPT_dependency>

## :six: 13:00 - 13:30 | Intro to Profiling

Hello, welcome to this session; please ask your questions here!

- Is there a history of the commands being used anywhere? They are moving quite fast
  - we will have a documented example on the Baskeville GitHub
- We only have 'movies' in the rfi relion project folder, is this correct?

- *what is profiling?*
  - Analyse the performance of your code
    - measure the time it takes to run
    - monitor the resources (CPU, GPU, memory, I/O) it consumes
  - Discover bottlenecks and optimise your application
  - Improve efficiency and consume less power!

## :seven: 13:30 - 14:30 | Self-installed software with `pip` and using containers

Hello, welcome to this session; please ask your questions here!

- Can other languages than python be used (e.g R), and if so can packages be installed via managers like BioConductor (biocmanager)?
  - Yep you can self-install any software you like. One thing to note that apps loaded through the `module load` command are built and optimised for Baskerville for the best (and fastest) performance
  - You can module load R (see [here](https://apps.baskerville.ac.uk/applications/R/))
  - R can be moved onto our live environment on request

- Why is [$pip list] returning '-bash: list: command not found'?
  - Are you running this yourself on Baskerville? Make sure you have the Python module loaded, and the `pip` command should then be available.
  - I tried this as well and got:

```bash
pip list
  File "<stdin>", line 1
    pip list
           ^
SyntaxError: invalid syntax
```

- It works for me, could you try

```bash
[wongj@bask-pg-login02 ~]$ module purge
[wongj@bask-pg-login02 ~]$ module load baskerville
Detected OS: RedHatEnterprise 8.6
[wongj@bask-pg-login02 ~]$ module load Python/3.10.4-GCCcore-11.3.0
GCCcore/11.3.0
...
[wongj@bask-pg-login02 ~]$ pip list
Package                           Version
--------------------------------- -----------
alabaster                         0.7.12
appdirs                           1.4.4
...
```

- yes this seems to work, i thought i could just enter with >python3 and run commands, didn't realise i had to load a specific python version
  - Yeah so Simon was talking about the "system" Python at the beginning, which is the Python installed with your operating system (often old and out of date, do not use :x:).
  - If you want to build environments using different versions of Python, then use `module purge; module load baskerville; module load Python/<desired_version>` at the very least before creating your `venv` :heavy_check_mark:
  - Baskerville's system Python can be found using `which python3`, which points to `/usr/bin/python3`, and is running on v3.6.8! :x:

``` bash
[wongj@bask-pg-login02 ~]$ python3 --version
Python 3.6.8
```

## :eight: 14:45 - 15:45 | Intro to Baskerville Portal

Hello, welcome to this session; please ask your questions here!

- Should everything be built in your own conda environment?
  - if you use conda you should include CUDA and dependencies for completeness and not system/modules.
- how possible is it to get portal extensions installed?
  - It depends you would have to request it and we will see if it is possible.
- [Conda cheetsheet](https://docs.conda.io/projects/conda/en/latest/_downloads/843d9e0198f2a193a3484886fa28163c/conda-cheatsheet.pdf)

## :hugging_face: Wrap-up and Close

Thank you for participating in our Baskerville Training session! Please bookmark our [GitHub](https://github.com/baskerville-hpc) repo to view materials after this event. If you need technical support on Baskerville after this event, please see [https://docs.baskerville.ac.uk/support/](https://docs.baskerville.ac.uk/support/).

### Feedback

Feedback is important to us and allows us to improve for next time - we would appreciate if you could fill out our [feedback form](https://forms.gle/hN7XNvGHmCCzzTGd8).

![image](https://hackmd.io/_uploads/S1cgCtXr6.png)

### Case Studies

We are always on the lookout for case studies to show off the amazing research that you do on Baskerville HPC :mag: If you are interested in us creating a case study of your work, please [email us](mailto:baskerville-tier2-support@contacts.bham.ac.uk).

### Advice Sessions

If you are interested in a 1 hour free advice session with our RSEs, please [email us](mailto:baskerville-tier2-support@contacts.bham.ac.uk) and we will happily book you in.

### Join the Slack

We have a (hidden) `#baskerville-rse` channel in the [ukrse.slack.com](https://ukrse.slack.com/) Slack - join us there to continue the conversation :smiley:
