Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F9A110A
	for <timestamp@lists.linux.dev>; Wed, 22 Jun 2022 07:44:43 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so10564245wmq.0
        for <timestamp@lists.linux.dev>; Wed, 22 Jun 2022 00:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=psmBxEzArHL2ZgwFsOWPMFMN1NGOdx4KVNPtZvwVGp8v46SWyeAkJLX2tj+gOqDw3p
         svqU4SKVfq7ZaG9KCmBSymoByhcWhL1YKq6Y2Yk4SvMzSiPZb90Gf5k5k2PM+IkrhZ2q
         n1kV3p+KunW/j8YK8AM++xOBGI5Zdc3lyN32OhJQtlhECNyhuEzaAZjghK7trx2/GqIc
         HE9yMs3BDuzlmdCqyeQXONUmpBHqHSbqNqPVbo8h+nvlODM8oZduTQ2f2+I2CjVmvWr+
         y1NZTW0wBr1m3XSVzWoO7ZSylEemg7jcjqPdZxBqy4UotB7V/lDOAg9BNlFJIqhp188F
         6IlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=rkRpBFVHzPIEpQ3hWR8TU1XC9p7av+WSY9dHYtiCfsCyQRNJ/1bdu0qtlpM6/bgbmD
         3JGw7dKX4lCudj8JyUf9N+Z2mllQDjFE62WNMBM7ynB/bgnHO6dUhDKLglathACPtwfA
         35KycpsfkaRZGsy0+j5cecEGylu1dRdl3hBQPejTclwsOXWEQxbnIOXWOOTkHgHE9tco
         KeXW96XlGZ9qHfGWAIJWsjRuk/14QptM0RFihbBzCCktkgpuEy9iw25yIt3cFZVMCpxX
         vNJKrgUKcCF8wir8gj/HWFYjtdWYFQFTB/yKkoXoqGytGw1ZwaatBfyJSbhmDDil6aqD
         EeUQ==
X-Gm-Message-State: AOAM530g4TY6+Xv8u9Ceb0yqZv9JnBQTwBrYnTuBnnfQumPT3CYQUSmf
	dwumzdPHTXYo+qtuoZmrjXck2NRns3GsdfOLd6NVhfvXN6DqS0+n
X-Google-Smtp-Source: ABdhPJyVK89j11nnzBSH9PDYBey3haiArr/qGHgej+6LRtmJykn3MRB8r+1tWQqAf7dj9xL/ePQEgARiw2wqzozUnu8=
X-Received: by 2002:a05:600c:2307:b0:39c:6ce3:2a06 with SMTP id
 7-20020a05600c230700b0039c6ce32a06mr45414586wmo.113.1655883881808; Wed, 22
 Jun 2022 00:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Wed, 22 Jun 2022 13:14:30 +0530
Message-ID: <CAH=dH98KQCV1gdP2gJM+VOkUy2afCn-SYS413+D9xAHMCnVRpg@mail.gmail.com>
Subject: Test Mail to Timestamp
To: timestamp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
