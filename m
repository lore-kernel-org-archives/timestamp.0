Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F7E23B9
	for <timestamp@lists.linux.dev>; Sat,  3 Dec 2022 09:50:03 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id z192so8861819yba.0
        for <timestamp@lists.linux.dev>; Sat, 03 Dec 2022 01:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+A+39eT+VUwYgDR7VSujsrbLtoh5i9loTUu03PvGh70=;
        b=Gip4AWoWEMhEnONIqN1mk384oOc/M9mv3RtgWKzJRavC4kZbEtn67/6Qc//FVfx0s6
         zw5oH0w84f2E7fcXUpZmKJVrshtjzsHZ9l5HEUnyh4Q/295Dk7szRvmNRqRgqsIC5Mf/
         R0lMu674psxNFl5vriz5Z2+Bv/LQsMU2d1BHdH/7FANCfsQs23mIN1rE9bMNdymlZUJv
         Tgky6lP4syF1+32DuxvPNk9/Y17Q+3MBGMgqdQW9/X3fN5cw1nfgWC06/eirxRSh3JeE
         o6rM/NamQXB8nJFHvt4hdRGPTUR2lx+KUGKHbCDBQ3zUhbATBVcT7RD1nRbkJmCDcX66
         Gobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+A+39eT+VUwYgDR7VSujsrbLtoh5i9loTUu03PvGh70=;
        b=irAgiyAfQBA3pOEO//vxuGIKhANAJpNj0NNuYxNYI5L18A+2lQ8GPWoAUuzhmGzc7D
         0ZC0X9D49aG7WzZ8k1j1KuSQOxCEnPPBorDouYhK9iET5dpBUUQrmDvWSg5efOZxj4hT
         rKZBqn1rmjWTT+TL0o9Fjl1FJ1KtdLuXHReGxbmcwtVIzdce6Cugv7hTSBrPL2FFOvlw
         sHVOS8/QBlJLnS/X7bn5MkG6PhnBqrxUw2TToRTkSHSnbACaMXXOV9neAowyhBRtjFmc
         pp5+snICAbUH+nCXYwvlVMPse+J9LFI//UurZxaVoeSL4D1do28JPYOrT25m4qqd5puy
         TCnw==
X-Gm-Message-State: ANoB5plk/MVpSHxW3dBjrQncSOxJEuNuBCCpM4QoJbHmfTv0WRr/EEQy
	4tXcrBunKO6msnXBwXiBQvF5wEb+5UOKitVeLA24Cg==
X-Google-Smtp-Source: AA0mqf6+ePH8ReGAiva5ptnEHTj1lXTQIDUDApP6ye2BCu5SYHXZ2rWdya15OvCay6WUljSxjhPChhZRsHgEO+3iRws=
X-Received: by 2002:a25:1843:0:b0:6dc:b9ec:7c87 with SMTP id
 64-20020a251843000000b006dcb9ec7c87mr54083229yby.322.1670061002473; Sat, 03
 Dec 2022 01:50:02 -0800 (PST)
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
In-Reply-To: <BYAPR11MB324034C53D14D8F7E332A3C5E1179@BYAPR11MB3240.namprd11.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 3 Dec 2022 10:49:50 +0100
Message-ID: <CACRpkdaTaDNB12vkmUVdmk0yBH-YW07RfcDO97q7d+ppLHj_iQ@mail.gmail.com>
Subject: Re: Intel timed i/o driver in HTE
To: "N, Pandith" <pandith.n@intel.com>, Johan Hovold <johan@kernel.org>
Cc: Dipen Patel <dipenp@nvidia.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Hall, Christopher S" <christopher.s.hall@intel.com>, "Gross, Mark" <mark.gross@intel.com>, 
	"Sangannavar, Mallikarjunappa" <mallikarjunappa.sangannavar@intel.com>, 
	"D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>, 
	"T R, Thejesh Reddy" <thejesh.reddy.t.r@intel.com>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"timestamp@lists.linux.dev" <timestamp@lists.linux.dev>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 2, 2022 at 4:00 AM N, Pandith <pandith.n@intel.com> wrote:

> > 1. Does timed io only meant for GPIO or other signals? if other signals, what
> > type of signals?
> This could be time sync signals or periodic/single pulse input for timestamp support
(...)
> b. char device creation for timestamping hardware. Something like /dev/hteX

No way this goes to userspace if the usecase is synchronizing GPS time.

It should be in the kernel, where the timebase of the system is.

We already created drivers/gnss because power, clock etc management
need to be close to the hardware, in the kernel. Don't try to push this
up to userspace, group it with the rest of the kernel GPS handling.

If your GPS vendor doesn't want the kernel to talk directly to the GPS,
bad luck, because the kernel definitely should in this case.  The kernel
has the best time source and the shortest access path to it, so there
you go.

The GPS vendors have already created enough of a mess by not having
open documentation for their hardware, if this is an incentive for them to
be more open if they want proper time sync that is *good*.

Yours,
Linus Walleij
