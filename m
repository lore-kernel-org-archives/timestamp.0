Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B256233C1
	for <timestamp@lists.linux.dev>; Wed, 23 Nov 2022 21:23:07 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-3b48b139b46so2566747b3.12
        for <timestamp@lists.linux.dev>; Wed, 23 Nov 2022 13:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=80FECUBxUdFegKjeWsNqCyoU5iWi51VHxXwc7NeBlDo=;
        b=uLOkELm67Pj8ICSMSuAE32FIGw3wbJOJtLSkE3chVoNtaDuDwYgxvkJBczA1y2RJJS
         JHyZOKwrTEeqFyrRv2Rfkrpf0TFOP+PVMhx2UtQIC8hnZTwIWWMsyzxCI4GeSaKNhsMF
         lC1zWy9sHMdicAokBtDJMhL7LIu4W7e9NIYHOXdhSo64f7cHf2B2ra/IXtBsUabZNl+3
         frG+4QP8pYMimMyEcqUapGVg8JOPSZu5CAM+UgxdHBTemyjW0UVLW7dZdQVP4EnJTZ0S
         FEJH5xQfHeEGDtB6zrx1YRmk1Ob5+PxubdD/ixhqAjkonYngkQXh3aeHfoqIvjo/bd2w
         mJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80FECUBxUdFegKjeWsNqCyoU5iWi51VHxXwc7NeBlDo=;
        b=ZaLHmzSnmf1FefetoJPBwIUXlPULkrSMhH1joKvH4g77LEp2px4E+xVp9qBhD26GsX
         6esrgh4geJIBr47MvflTKOiPWuL159fBa72d1/w/Y2Wik+MN7FMwyKc8F3S62XsFlo0v
         wNvws7cW8vPmIOLeuC9Hldp/0uWUlFqAaceKWEq+PvNIl3QWlZMtk+SXAW26ThH1ddAP
         iPQ8zeR/wW5r9AvYD5zyq0Tyqkh6ZKioW8nE4DYvoj96Hn6R4Z2encj8StJEif4t7ZYF
         avjORPEYRNjL0PGoDb5s/iXCIKejGa/xR0oHpWCqqX2gmqH7nIlnw90zKhBGCNLUfwym
         jeLg==
X-Gm-Message-State: ANoB5pmReDZ3S0EfwrlKbh77S7TO67O1lZnMyV27gLBNXXOnGC5B1ihF
	ACF0zS70CXAIiGcr9bXcsKNqdJJq4WzsgGh4OoI4hQ==
X-Google-Smtp-Source: AA0mqf6MQHlEWs88gbqnsRD9Yv59kYkMampxraRXzAUqmPsucry9XnsWum+Xv66YNpMkuExEnefoQ9PgtVZoVQu19Fk=
X-Received: by 2002:a81:65c1:0:b0:376:f7e2:4b12 with SMTP id
 z184-20020a8165c1000000b00376f7e24b12mr11999618ywb.0.1669238586662; Wed, 23
 Nov 2022 13:23:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BYAPR11MB3240F382BD180FF90C7DF0B9E1069@BYAPR11MB3240.namprd11.prod.outlook.com>
 <7de35859-97ab-8e88-f590-d5851b81773b@nvidia.com> <BYAPR11MB32405F4FA22BB47BD03C8F18E10C9@BYAPR11MB3240.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB32405F4FA22BB47BD03C8F18E10C9@BYAPR11MB3240.namprd11.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Nov 2022 22:22:55 +0100
Message-ID: <CACRpkdbY5aU3OTufA0q+N7Pwm0shGgnjScAGR_96oo9XdgBDhQ@mail.gmail.com>
Subject: Re: Intel timed i/o driver in HTE
To: "N, Pandith" <pandith.n@intel.com>
Cc: Dipen Patel <dipenp@nvidia.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Hall, Christopher S" <christopher.s.hall@intel.com>, "Gross, Mark" <mark.gross@intel.com>, 
	"Sangannavar, Mallikarjunappa" <mallikarjunappa.sangannavar@intel.com>, 
	"D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>, 
	"T R, Thejesh Reddy" <thejesh.reddy.t.r@intel.com>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"timestamp@lists.linux.dev" <timestamp@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 23, 2022 at 3:38 PM N, Pandith <pandith.n@intel.com> wrote:

> Since the current gpio framework is inadequate to periodic output modes.
> I thought to disentangle from gpio and develop a new hte consumer. Something like hte-libcdev.c

Maybe, if Dipen wants it.
Or maybe it needs its own subsystem.
Or maybe it should be with whatever is using these pulse trains.

Again: what is it used for? If we have no idea what it is supposed to
be used for, we cannot place it right, even less test it.

Yours,
Linus Walleij
