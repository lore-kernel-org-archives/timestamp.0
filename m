Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF9FA460
	for <timestamp@lists.linux.dev>; Thu,  8 Dec 2022 22:10:51 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id i186so3372881ybc.9
        for <timestamp@lists.linux.dev>; Thu, 08 Dec 2022 14:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GlnKwCM+RiupdXA6cs5QqgrNaf48G0/GZTk3jwIRsLA=;
        b=u1UXoQ4QFd/pYaY44ys8dwVAgJjH5SG22JiE6WI3T/vEjgqMG2avck3clvDZgLXwzY
         Lk8VuODv9nrMVfUhXnt1lsXBildi2l5O3Sdh7sqD7K0B59iKU1K8ihQ4q1+ZWCegceW7
         Tf+oGNKiZVNtpMGmBEON+HWRpvnPf1SCqr5MBDg+7bEf9slkj3FBCG+MrKnI0uAWuvBO
         KCCyWreBS8V9vPiGlGSwqpjeRYl1ulnfeMEz+hUiXxMZ7j25+Udwwoy3EF1ADv8WP/iA
         c3KPbJ8kcJcxKwmYwyBHAbwWI1hno9KTV/itHodzTF6k8K0DZRJZOHWlFgAvLM+0tdoK
         nYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlnKwCM+RiupdXA6cs5QqgrNaf48G0/GZTk3jwIRsLA=;
        b=FhiAOJULgKc8+wD1eZQmt4xv2kHoQpfzM85ltjknkIyF2NDH+zQUGJ6wATL4qDESa3
         WI03RaIBHXbq31VQzqD20P53ff8jgdv12rW8GuZ9U1GfHSeUEMQa938qCg8tcT1r/7jU
         pxdYyx9NTGy0+Mpc1/WSwBp0Ysl1PjEKfAeW7dfTqW+DFh4bLteBImUGA74AQb+ujFRs
         ia9+nIYeq+Q6V7T1mpWvZP3nfq7lJFRlqOqcaIE2udVpxsSLdYRoYODxL7YKCi44JmN0
         rBu9pZ4Dz5h1k4KJ+TEikbJXMcxbZHQ7pg0iYdDyNIwsTIzbDycuoC1aHJhQYC62ZEvT
         i9GA==
X-Gm-Message-State: ANoB5pmpN5toaKF3bbvoyfvYJH1ATKAOFtPEt+dfYEy0h2zMmswcyYaS
	ZUhH7+wiY9pKUAHWzKdxBWTyKLHrtimneUwvhA9Tog==
X-Google-Smtp-Source: AA0mqf7k2rXJzsp3owofHLadYx2njTpl+Cn89G+/gTH9j4sizhKXJVD907a1oo2LWwUuxip3tqXfWZU1mHvG4WStX9o=
X-Received: by 2002:a25:8e82:0:b0:6d2:70d5:3ed0 with SMTP id
 q2-20020a258e82000000b006d270d53ed0mr94181732ybl.457.1670537450502; Thu, 08
 Dec 2022 14:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BYAPR11MB3240F382BD180FF90C7DF0B9E1069@BYAPR11MB3240.namprd11.prod.outlook.com>
 <7de35859-97ab-8e88-f590-d5851b81773b@nvidia.com> <BYAPR11MB32405F4FA22BB47BD03C8F18E10C9@BYAPR11MB3240.namprd11.prod.outlook.com>
 <CACRpkdbY5aU3OTufA0q+N7Pwm0shGgnjScAGR_96oo9XdgBDhQ@mail.gmail.com>
 <34baa0b1-72c3-e4b3-3eaf-9b07fe86c3df@nvidia.com> <BYAPR11MB324034C53D14D8F7E332A3C5E1179@BYAPR11MB3240.namprd11.prod.outlook.com>
 <CACRpkdaTaDNB12vkmUVdmk0yBH-YW07RfcDO97q7d+ppLHj_iQ@mail.gmail.com> <MWHPR11MB1984A17A2263E5EBAB8B9853C21D9@MWHPR11MB1984.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB1984A17A2263E5EBAB8B9853C21D9@MWHPR11MB1984.namprd11.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Dec 2022 23:10:38 +0100
Message-ID: <CACRpkdbi7ArVe83XOLGot+j49fSj_hXhxGuC9o4woYgN9Mpt+g@mail.gmail.com>
Subject: Re: Intel timed i/o driver in HTE
To: "Hall, Christopher S" <christopher.s.hall@intel.com>
Cc: "N, Pandith" <pandith.n@intel.com>, Johan Hovold <johan@kernel.org>, 
	Dipen Patel <dipenp@nvidia.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Gross, Mark" <mark.gross@intel.com>, 
	"Sangannavar, Mallikarjunappa" <mallikarjunappa.sangannavar@intel.com>, 
	"D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>, 
	"T R, Thejesh Reddy" <thejesh.reddy.t.r@intel.com>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"timestamp@lists.linux.dev" <timestamp@lists.linux.dev>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Hi Christopher!

thanks for the lengthy explanation, I think I get it now.

As usual I have now a slight impostor syndrome for now knowing
what PPS is and what it is for despite it has its own subsystem
and all.

On Thu, Dec 8, 2022 at 5:52 AM Hall, Christopher S
<christopher.s.hall@intel.com> wrote:

> For PPS input, we plan to use the PPS subsystem.

Why are you not planning to use the PPS "generators" for output?

> The application configures the pin for PPS input
> A device in created /dev/ppsX
> while 1:
>         The timed I/O device captures / timestamps a pulse from an
>                 external PPS provider
>         The timestamp is translated to system time(TN)
>         A PPS event is generated using pps_event(TN
>
> Another application like PHC2SYS or Chrony consumes the timestamps from
> the PPS device and disciplines the system clock.

This is great and to the point.

> Currently, most - maybe all - PPS clients (drivers/pps/clients) capture
> timestamps in software (pps_get_ts()). We can do at least 50x better
> timestamping using hardware. The timestamp accuracy is in the range of
> a few 10s of nanoseconds. I think this is a good thing.

So the plan is to let a driver in drivers/pps obtain a timed IO input
from the HTE subsystem with high resution, which is great.

> Again we provided an example application. Let's not get "hung up" on GPS.
> There are many GPS receivers that produce a PPS output.

OK I'm sorry for being so stubborn with that example.

> If I may, I would like to re-focus the discussion. The question we want
> to answer in this thread is whether it makes sense to modify the HTE
> subsystem to accommodate our device and whether it "belongs" there.

Yeah I agree.

> To summarize this and previous threads the Timed IO use case is
> importing and exporting system time with about nanosecond precision.

Yeah I think that point has not been the main focus actually:
maybe I'm especially dumb but it looked to me as posed for
"random events" in and "random pulsetrains" out. But in this
context it makes much more sense.

> We also want to be able to timestamp / generate single events.
> Existing HTE already do the first.
>
> Are these use cases that you are willing to support in the HTE
> subsystem? We seem to be unable to dig into the implementation
> without circling back to the use cases which I believe are
> clearly defined.

Sorry for the misunderstandings. This is really Dipen's decision.

If you ask me, it seems like you should begin with making a
PPS input using the HTE as back-end, then think about the next
thing.

If this *makes* *sense*, and is not over-generalizing the
timed input. I.e. if you expect people to be using it for some
random other line sampling unrelated to PPS. There is no
point in putting it into drivers/hte for random abstraction.

Otherwise by all means put the whole thing into drivers/pps
why not? If that is what it is for?

This *could* be one of those cases where the subsystem is not
a clear cut, and that does not matter because we are not especially
OCD about pigeon-holeing hardware into one subsystem and
one subsystem only.

Perhaps the output mode should just go into drivers/pps/generators
without any HTE back-end while the input mode uses
HTE?

The fact that this is one single HW block doesn't really matter
as long as you can share the hw access using something like
MFD or regmap in worst case.

Yours,
Linus Walleij
